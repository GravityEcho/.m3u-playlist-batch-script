@echo off 
setlocal enableDelayedExpansion
chcp 65001

set link1=link1
set link2=link2
set link3=link3

cd /d "%~dp0"

set "i=0"
for /f "tokens=1" %%a in (CBBB.txt) do (   
    set /a "i+=1"
    set "var[!i!]=%%a" 
)   

set "total=!i!"
>CBBB.m3u8 echo #EXTM3U8 
>>CBBB.m3u8 (
    for /l %%p in (1,1,!total!) do (
	set /a num=!random! %%10 +1
        echo #EXTINF:-1 ,!var[%%p]!
		echo %link1%!num!%link2%!var[%%p]!%link3%
    )
)
