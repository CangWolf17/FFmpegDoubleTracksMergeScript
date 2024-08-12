# 基于FFmpeg的双音轨视频音轨合并脚本

主要用于将N卡捕获的多音轨视频合并为单音轨，项目为备份自用，由AI辅助编写



## 前置环境

- [FFmpeg](https://ffmpeg.org/)



## 项目文件

- [merge_video_audio.bat](https://github.com/CangWolf17/FFmpegDoubleTracksMergeScript/blob/main/merge_video_audio.bat)

  - 提取双音轨视频文件（仅测试.MP4）的音频并合并

  - 主要支持将视频拖拽的bat文件后进行处理

  - 支持拖拽多个视频

  - 支持简单的错误处理

  - 当脚本运行正常不出错时，自动结束

- [merge_video_audio_dropit.bat](https://github.com/CangWolf17/FFmpegDoubleTracksMergeScript/blob/main/merge_video_audio_dropit.bat)

  - 为[Drop It](http://www.dropitproject.com/ )软件做支持的文件，因为单独放着一个bat文件太难看了所以用Drop It协议链接到它来处理

  - 因为Drop It是为每个文件单独调用一次应用程序，所以脚本会打开多个窗口

  - 可供参考的Drop It匹配规则：

    ```Regex
    .*\d{4}\.\d{2}\.\d{2} - \d{2}\.\d{2}\.\d{2}\.\d{2}.*\.mp4$
    ```

    用于匹配录像文件中的时间格式字符串



## 代码支持

由于是自用且是AI辅助写的所以非必要不做后续更新支持

