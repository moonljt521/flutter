#!/bin/bash

echo "=== 检查 Flutter 环境 ==="
flutter doctor -v

echo ""
echo "=== 检查连接的设备 ==="
flutter devices

echo ""
echo "=== 检查 ADB 设备 ==="
adb devices
