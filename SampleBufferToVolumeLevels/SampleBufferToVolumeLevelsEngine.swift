//
//  SampleBufferToVolumeLevelsEngine.swift
//  SampleBufferToVolumeLevels
//
//  Created by huyangyang on 2017/12/8.
//  Copyright © 2017年 HuYangYang.com. All rights reserved.
//

import UIKit
import AVFoundation
public class SampleBufferToVolumeLevelsEngine: NSObject {

    class func getVolumeLevelsFromeSampleBuffer(sampleBuffer : CMSampleBuffer) -> Float {
        var buffer: CMBlockBuffer? = nil
        
        // Needs to be initialized somehow, even if we take only the address
        var audioBufferList = AudioBufferList(mNumberBuffers: 1,
                                              mBuffers: AudioBuffer(mNumberChannels: 1, mDataByteSize: 0, mData: nil))
        
        CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(
            sampleBuffer,
            nil,
            &audioBufferList,
            MemoryLayout<AudioBufferList>.size,
            nil,
            nil,
            UInt32(kCMSampleBufferFlag_AudioBufferList_Assure16ByteAlignment),
            &buffer
        )
        
        let abl = UnsafeMutableAudioBufferListPointer(&audioBufferList)



        for buffer in abl {

            
            let samplesCount = Int(buffer.mDataByteSize) / MemoryLayout<Int16>.size
            let samplesPointer = audioBufferList.mBuffers.mData!.bindMemory(to: Int16.self, capacity: samplesCount)
            let samples = UnsafeMutableBufferPointer<Int16>(start: samplesPointer, count: samplesCount)

            var sum:Int64 = 0
            
            for sample in samples {
                let s = Int64(sample)
                sum = (sum + s*s)
            }
            return (sqrt(Float(sum/Int64(samples.count))))
        }
        return 0.0;
        
    }
    
}
