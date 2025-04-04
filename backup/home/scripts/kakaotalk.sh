#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"    # get executing script path
KAKAO_EXCUTABLE_LINK_FILE="KakaoTalk.exe"

wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Kakao/KakaoTalk/KakaoTalk.exe &> /dev/null &
