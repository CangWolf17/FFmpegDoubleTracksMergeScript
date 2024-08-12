@echo off
setlocal enabledelayedexpansion

:: 检查是否有参数传入
if "%~1"=="" (
    echo 请将视频文件拖动到这个批处理文件上，或通过Drop It传递文件路径。
    pause
    exit /b
)

:: 获取传入的文件绝对路径
set "video_file=%~1"

:: 获取传入文件的目录路径
for %%I in ("%video_file%") do set "video_dir=%%~dpI"

:: 跳转到传入文件的目录
cd /d "!video_dir!"

:: 获取没有扩展名的文件名
for %%I in ("%video_file%") do set "file_name_no_ext=%%~nI"

:: 设置输出视频文件名
set "output_video=!file_name_no_ext!_merged_audio.mp4"

:: 执行ffmpeg命令
ffmpeg -i "!video_file!" -c:v copy -c:a aac -strict experimental -b:a 192k -filter_complex "amerge" "!output_video!" || (
    echo 发生错误，有可能是传入的视频文件只有一个音轨，即将删除错误文件
    pause
     del "!output_video!"
    exit /b
)

echo 音轨合并完成: !output_video!
