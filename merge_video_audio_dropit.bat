@echo off
setlocal enabledelayedexpansion

:: ����Ƿ��в�������
if "%~1"=="" (
    echo �뽫��Ƶ�ļ��϶�������������ļ��ϣ���ͨ��Drop It�����ļ�·����
    pause
    exit /b
)

:: ��ȡ������ļ�����·��
set "video_file=%~1"

:: ��ȡ�����ļ���Ŀ¼·��
for %%I in ("%video_file%") do set "video_dir=%%~dpI"

:: ��ת�������ļ���Ŀ¼
cd /d "!video_dir!"

:: ��ȡû����չ�����ļ���
for %%I in ("%video_file%") do set "file_name_no_ext=%%~nI"

:: ���������Ƶ�ļ���
set "output_video=!file_name_no_ext!_merged_audio.mp4"

:: ִ��ffmpeg����
ffmpeg -i "!video_file!" -c:v copy -c:a aac -strict experimental -b:a 192k -filter_complex "amerge" "!output_video!" || (
    echo ���������п����Ǵ������Ƶ�ļ�ֻ��һ�����죬����ɾ�������ļ�
    pause
     del "!output_video!"
    exit /b
)

echo ����ϲ����: !output_video!
