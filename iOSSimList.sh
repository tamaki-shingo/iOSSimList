#!/bin/sh

if [[ $1 = 'xctest' ]]
then
  DEVICE_LIST=`find ~/Library/Developer/XCTestDevices/ -name device.plist`;
else
  DEVICE_LIST=`find ~/Library/Developer/CoreSimulator/Devices/ -name device.plist`;
fi

array=($DEVICE_LIST)
 for i in "${array[@]}"
 do
   echo `/usr/libexec/PlistBuddy -c 'Print UDID' ${i}` - `/usr/libexec/PlistBuddy -c 'Print name' ${i}`'('`/usr/libexec/PlistBuddy -c 'Print runtime' ${i} | cut -c 36-99 | sed -e "s/-/./g"`')';
 done
