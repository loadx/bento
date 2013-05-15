#!/bin/bash -e
PROFILE=/etc/profile
SBIN_PATH=$(cat ${PROFILE} | grep '\sPATH=\"[^\"]*"' | grep "sbin" | cut -d '"' -f2)

# delete lines 4-8
sed -i '4,8d;' ${PROFILE}

# force the PATH to include sbin(s)`
# need to change sed escape char because paths have slashes
sed -i -r "s#export PATH#PATH=${SBIN_PATH}\nexport PATH#g" ${PROFILE}
