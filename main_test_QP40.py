from __future__ import division
import os
import time
os.environ['TF_CPP_MIN_LOG_LEVEL']='0'

import numpy as np
import argparse
import cv2
import tensorflow as tf
import tensorflow.contrib.slim as slim

# Set parameter for MDCNN's testing
parser = argparse.ArgumentParser()
parser.add_argument("--model_name",default="MDCNN_",help="model name")
parser.add_argument("--data_path",default="/home/zhao/Desktop/MDCNN2018/MDCNN_test40/data/",help="path to the data")# change to be yours
parser.add_argument("--input_height",type=int,default=512,help="input height")
parser.add_argument("--input_width",type=int,default=512,help="input width")
parser.add_argument("--lowinput_height",type=int,default=256,help="input height")
parser.add_argument("--lowinput_width",type=int,default=256,help="input width")
parser.add_argument("--QF",type=float,default=40,help="qualityfactor:low value means low quality")
parser.add_argument("--log_directory",default="/home/zhao/Desktop/MDCNN2018/MDCNN_test40/tmp/",help="directory to save checkpoints and summaries")# change to be yours
args = parser.parse_args()

def conv(x, num_out_layers, kernel_size, stride, activation_fn=None):
    p = np.floor((kernel_size - 1) / 2).astype(np.int32)
    p_x = tf.pad(x, [[0, 0], [p, p], [p, p], [0, 0]])
    return slim.conv2d(p_x, num_out_layers, kernel_size, stride, 'VALID', activation_fn=activation_fn)

def deconv(x, num_out_layers, kernel_size, scale):
    conv = slim.conv2d_transpose(x, num_out_layers, kernel_size, scale, 'SAME',activation_fn=None)
    return conv

# Multiple description reconstruction network (MDRN) includs side reconstruction network (SRN) and central reconstruction network (CRN)
def MDRN(inputsa,inputsb):

    # side reconstruction network (SRN) for A
    conv1a   = conv(inputsa, 128, 9, 1, activation_fn=tf.nn.relu)
    conv2a   = conv(conv1a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3a   = conv(conv2a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4a   = conv(conv3a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5a   = conv(conv4a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6a   = conv(conv5a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7a   = conv(conv6a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8a   = deconv(conv7a, 1, [9, 9], [2, 2])
    outputsa = conv8a

    # side reconstruction network (SRN) for B
    conv1b   = conv(inputsb, 128, 9, 1, activation_fn=tf.nn.relu)
    conv2b   = conv(conv1b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3b   = conv(conv2b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4b   = conv(conv3b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5b   = conv(conv4b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6b   = conv(conv5b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7b   = conv(conv6b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8b   = deconv(conv7b, 1, [9, 9], [2, 2])
    outputsb = conv8b

    # central reconstruction network (CRN)
    conv1c   = conv(tf.concat([inputsa,inputsb],3), 128, 9, 1, activation_fn=tf.nn.relu)
    conv2c   = conv(conv1c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3c   = conv(conv2c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4c   = conv(conv3c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5c   = conv(conv4c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6c   = conv(conv5c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7c   = conv(conv6c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8c   = deconv(conv7c, 1, [9, 9], [2, 2])
    outputsc = conv8c
    return outputsa, outputsb, outputsc

# Multiple description virtual codec network (MDVCN) is proposed to bridge the gap between MDGN network and MDRN network in order to train an end-to-end MDC framework.
def MDVCN(inputsa,inputsb):

    # virtual side reconstruction network (VSRNA) for A
    conv1a   = conv(inputsa, 128, 9, 1, activation_fn=tf.nn.relu)
    conv2a   = conv(conv1a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3a   = conv(conv2a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4a   = conv(conv3a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5a   = conv(conv4a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6a   = conv(conv5a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7a   = conv(conv6a,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8a   = deconv(conv7a, 1, [9, 9], [2, 2])
    outputsa = conv8a

    # virtual side reconstruction network (VSRNB) for B
    conv1b   = conv(inputsb, 128, 9, 1, activation_fn=tf.nn.relu)
    conv2b   = conv(conv1b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3b   = conv(conv2b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4b   = conv(conv3b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5b   = conv(conv4b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6b   = conv(conv5b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7b   = conv(conv6b,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8b   = deconv(conv7b, 1, [9, 9], [2, 2])
    outputsb = conv8b

    # virtual central reconstruction network (VCRN)
    conv1c   = conv(tf.concat([inputsa,inputsb],3), 128, 9, 1, activation_fn=tf.nn.relu)
    conv2c   = conv(conv1c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv3c   = conv(conv2c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4c   = conv(conv3c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv5c   = conv(conv4c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6c   = conv(conv5c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv7c   = conv(conv6c,  128, 3, 1, activation_fn=tf.nn.relu)
    conv8c   = deconv(conv7c, 1, [9, 9], [2, 2])
    outputsc = conv8c
    return outputsa, outputsb, outputsc

# Multiple description generator network (MDGN)
def MDGN(inputs):

    conv1   = conv(inputs, 128, 9, 1, activation_fn=tf.nn.relu)
    conv2   = conv(conv1,  128, 3, 2, activation_fn=tf.nn.relu)
    conv3   = conv(conv2,  128, 3, 1, activation_fn=tf.nn.relu)
    conv4   = conv(conv3,  128, 3, 1, activation_fn=tf.nn.relu)

    conv5aa   = conv(conv4,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6aa   = conv(conv5aa,128, 3, 1, activation_fn=tf.nn.relu)
    conv7aa   = conv(conv6aa,1, 9, 1, activation_fn=None)
    outputsda = tf.clip_by_value(conv7aa,0.0,1.0)

    conv5bb   = conv(conv4,  128, 3, 1, activation_fn=tf.nn.relu)
    conv6bb   = conv(conv5bb,128, 3, 1, activation_fn=tf.nn.relu)
    conv7bb   = conv(conv6bb,1, 9, 1, activation_fn=None)
    outputsdb = tf.clip_by_value(conv7bb,0.0,1.0)
    
    return outputsda, outputsdb

def LearnMDGN_and_MDVCN(inputs):

    with tf.variable_scope('DESCRIPTORCNN', reuse=None):
        outputsda, outputsdb = MDGN(inputs)

    with tf.variable_scope('CODECNN', reuse=None):
        _, _, _ = MDVCN(outputsda, outputsdb)

    return outputsda, outputsdb

def LearnMDRN(inputsa,inputsb):

    with tf.variable_scope("POSTCNN", reuse=None):
        outputsa, outputsb, outputsc = MDRN(inputsa,inputsb)
    return outputsa, outputsb, outputsc

# testing MDRN
def TestMDRN():

    with tf.Graph().as_default():
        ##PLACEHOLDER
        inputsa = tf.placeholder(tf.float32, [None,None,None, 1])
        inputsb = tf.placeholder(tf.float32, [None,None,None, 1])

        ## build model
        outputsa, outputsb, outputsc = LearnMDRN(inputsa, inputsb)

        ## sess
        config = tf.ConfigProto(allow_soft_placement=True)
        sess = tf.Session(config=config)

        ## save
        train_saver = tf.train.Saver()

        ## initialize variables
        sess.run(tf.global_variables_initializer())
        sess.run(tf.local_variables_initializer())
        coordinator = tf.train.Coordinator()
        threads = tf.train.start_queue_runners(sess=sess, coord=coordinator)

        ## restore
        restore_path = tf.train.latest_checkpoint(
            args.log_directory + '/' + args.model_name + 'MDRN')
        train_saver.restore(sess, restore_path)

        pathpnga = args.data_path + '/' + 'a.jpg'
        pathpngb = args.data_path + '/' + 'b.jpg'

        ima = cv2.imread(pathpnga)
        imb = cv2.imread(pathpngb)

        ima = np.reshape(ima[:,:,0]/255.0, [1, args.lowinput_height, args.lowinput_width, 1])
        imb = np.reshape(imb[:,:,0]/255.0, [1, args.lowinput_height, args.lowinput_width, 1])
        resultsa,resultsb,resultsc = sess.run([outputsa, outputsb, outputsc],feed_dict={inputsa: ima, inputsb: imb})

        patha = args.data_path +  '/a_image_reconstruction.png'
        cv2.imwrite(patha, np.uint8(255.0 * resultsa[0,:, :, 0]))
        pathb = args.data_path +  '/b_image_reconstruction.png'
        cv2.imwrite(pathb, np.uint8(255.0 * resultsb[0,:, :, 0]))
        pathc = args.data_path +  '/c_image_reconstruction.png'
        cv2.imwrite(pathc, np.uint8(255.0 * resultsc[0,:, :, 0]))

# testing MDGN and MDVCN
def TestMDGN_and_MDVCN():

    with tf.Graph().as_default():
        ##PLACEHOLDER
        inputs = tf.placeholder(tf.float32, [None,None,None, 1])

        ## build model
        outputsa, outputsb = LearnMDGN_and_MDVCN(inputs)

        ## sess
        config = tf.ConfigProto(allow_soft_placement=True)
        sess = tf.Session(config=config)

        ## save
        train_saver = tf.train.Saver()

        ## initialize variables
        sess.run(tf.global_variables_initializer())
        sess.run(tf.local_variables_initializer())

        ## restore
        restore_path = tf.train.latest_checkpoint(args.log_directory + '/' + args.model_name + 'MDGN_and_MDVCN')
        train_saver.restore(sess, restore_path)

        pathpng = args.data_path + '/' + 'Lena.png'
        im = cv2.imread(pathpng)
        im=np.reshape(im[:,:,0]/255.0,[1, args.input_height, args.input_width, 1])
        resultsa, resultsb = sess.run([outputsa, outputsb], feed_dict={inputs: im})

        patha = args.data_path + '/a.png'
        cv2.imwrite(patha, np.uint8(255.0 * resultsa[0, :, :, 0]))
        pathb = args.data_path + '/b.png'
        cv2.imwrite(pathb, np.uint8(255.0 * resultsb[0, :, :, 0]))

def testCompressImage():
    # compresse image with STANDARD CODEC "JPEG"
    imlowa = cv2.imread(args.data_path +'/a.png')
    cv2.imwrite(args.data_path +'/a.jpg', imlowa,[int(cv2.IMWRITE_JPEG_QUALITY), args.QF])

    imlowb = cv2.imread(args.data_path +'/b.png')
    cv2.imwrite(args.data_path +'/b.jpg', imlowb,[int(cv2.IMWRITE_JPEG_QUALITY), args.QF])


def main(_):
    os.environ['CUDA_VISIBLE_DEVICES'] = '0'
    #with tf.device('/cpu:0'):

    print("start:TestMDGN_and_MDVCN")
    TestMDGN_and_MDVCN()
    print("finished:TestMDGN_and_MDVCN")

    print("start:CompressImage")
    testCompressImage()
    print("finished:CompressImage")

    print("start:TestMDRN")
    TestMDRN()
    print("finished:TestMDRN")

if __name__ == '__main__':
    tf.app.run()

