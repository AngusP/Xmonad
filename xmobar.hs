-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    bgColor = "#000000",
    fgColor = "#ffffff",
    font = "xft:Liberation Mono:bold:size=10:antialias=true",lowerOnStart = True,
    commands = [
        Run Memory ["-t","Mem:<usedratio>%","-H","50","-L","10",
                    "-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 15,
        Run Cpu ["-t","CPU:<total>%","-H","60","-L","20","-h","#FFB6B0",
                 "-l","#CEFFAC","-n","#FFFFCC"] 15,
        Run Network "wlp8s0" ["-t","Net:<rx>rx,<tx>tx","-H","200","-L","10",
                              "-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %_d %b %H:%M" "date" 10,
        Run Com "/bin/sh" ["-c","~/.xmonad/battscript.sh"] "battery" 20,
        Run Com "/bin/sh" ["-c","~/.xmonad/volscript.sh"] "vol" 5,
        Run Com "/bin/sh" ["-c","~/.xmonad/wifiscript.sh"] "radio" 20,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "  %StdinReader% }  %date%  {  %memory%  %cpu%  %wlp8s0% %radio%  %battery%  %vol%  "
}
