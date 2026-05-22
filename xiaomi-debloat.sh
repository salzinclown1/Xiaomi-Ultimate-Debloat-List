#!/bin/bash
# =============================================================================
# Xiaomi / MIUI Debloat Script
# =============================================================================
# Tested on: MIUI / HyperOS (Global)
# Method: adb shell pm uninstall -k --user 0
#
# This method uninstalls packages only for the current user (user 0).
# It is REVERSIBLE — to restore a package:
#   adb shell pm install-existing <package.name>
#
# Requirements:
#   - ADB installed on your PC
#   - USB Debugging enabled on the device
#   - Device connected via USB
#
# Usage:
#   chmod +x xiaomi-debloat.sh
#   ./xiaomi-debloat.sh
#
# References:
#   - https://github.com/fs0c131y (MIUI daemon data exfiltration research)
#   - https://github.com/0x192/universal-android-debloater
# =============================================================================

UNINSTALL="adb shell pm uninstall -k --user 0"

echo "========================================"
echo " Xiaomi / MIUI Debloat Script"
echo "========================================"
echo ""

# ----------------------------------------------------------------------------
# SPYWARE / TELEMETRY
# Packages known to collect and transmit data to external/Chinese servers.
# Removal strongly recommended.
# ----------------------------------------------------------------------------
echo "[*] Removing spyware / telemetry..."

$UNINSTALL com.miui.daemon           # Sends device data to Xiaomi servers (CN)
$UNINSTALL com.miui.analytics        # MIUI usage analytics
$UNINSTALL com.miui.misightservice   # Xiaomi data collection service
$UNINSTALL com.miui.msa.global       # MIUI System Ads & data aggregation

# ----------------------------------------------------------------------------
# FACEBOOK PREINSTALLED SERVICES
# Embedded at system level; track users even without the Facebook app.
# ----------------------------------------------------------------------------
echo "[*] Removing Facebook preinstalled services..."

$UNINSTALL com.facebook.system
$UNINSTALL com.facebook.appmanager
$UNINSTALL com.facebook.services

# ----------------------------------------------------------------------------
# XIAOMI / MIUI BLOATWARE
# Redundant or unwanted Xiaomi apps and services.
# ----------------------------------------------------------------------------
echo "[*] Removing Xiaomi / MIUI bloatware..."

$UNINSTALL com.xiaomi.calendar
$UNINSTALL com.xiaomi.aiasst.vision
$UNINSTALL com.xiaomi.cameramind
$UNINSTALL com.xiaomi.barrage
$UNINSTALL com.xiaomi.mipicks        # Xiaomi app store ads
$UNINSTALL com.xiaomi.aicr
$UNINSTALL com.xiaomi.glgm
$UNINSTALL com.xiaomi.mtb
$UNINSTALL com.xiaomi.xmsfkeeper
$UNINSTALL com.xiaomi.account        # Mi Account (skip if you use Mi services)
$UNINSTALL com.xiaomi.payment
$UNINSTALL com.xiaomi.simactivate.service
$UNINSTALL com.xiaomi.trustservice

$UNINSTALL com.miui.backup
$UNINSTALL com.miui.cloudbackup
$UNINSTALL com.miui.micloudsync
$UNINSTALL com.miui.cloudservice
$UNINSTALL com.miui.bugreport
$UNINSTALL com.miui.cleaner
$UNINSTALL com.miui.player
$UNINSTALL com.miui.videoplayer
$UNINSTALL com.miui.fm
$UNINSTALL com.miui.fmservice
$UNINSTALL com.miui.gallery
$UNINSTALL com.miui.mediaviewer
$UNINSTALL com.miui.phrase
$UNINSTALL com.miui.yellowpage
$UNINSTALL com.miui.vsimcore
$UNINSTALL com.miui.extraphoto
$UNINSTALL com.miui.qr
$UNINSTALL com.miui.accessibility
$UNINSTALL com.miui.miservice
$UNINSTALL com.miuix.editor
$UNINSTALL com.milink.service

$UNINSTALL com.mi.globalminusscreen  # Minus screen (left swipe feed)
$UNINSTALL com.mi.appfinder
$UNINSTALL com.mi.android.globalFileexplorer
$UNINSTALL com.mi.globalbrowser
$UNINSTALL org.mipay.android.manager

# ----------------------------------------------------------------------------
# MEDIATEK DIAGNOSTIC / DEBUG TOOLS
# Factory/engineering tools with no end-user purpose.
# ----------------------------------------------------------------------------
echo "[*] Removing MediaTek diagnostic tools..."

$UNINSTALL com.mediatek.engineermode
$UNINSTALL com.mediatek.lbs.em2.ui
$UNINSTALL com.mediatek.voiceunlock
$UNINSTALL com.mediatek.voicecommand
$UNINSTALL com.mediatek.magtapp
$UNINSTALL com.mediatek.mdmconfig
$UNINSTALL com.mediatek.mdmlsample
$UNINSTALL com.mediatek.ygps
$UNINSTALL com.debug.loggerui

# ----------------------------------------------------------------------------
# GOOGLE BLOATWARE (OPTIONAL)
# Remove only what you don't use.
# Commented out by default — uncomment as needed.
# ----------------------------------------------------------------------------
echo "[*] Skipping optional Google apps (edit script to enable)..."

# $UNINSTALL com.google.android.apps.photos         # Google Photos
# $UNINSTALL com.google.android.apps.maps           # Google Maps
# $UNINSTALL com.google.android.youtube             # YouTube
# $UNINSTALL com.google.android.gm                 # Gmail
# $UNINSTALL com.google.android.apps.messaging      # Google Messages
# $UNINSTALL com.google.android.dialer             # Google Phone
# $UNINSTALL com.google.android.contacts           # Google Contacts
# $UNINSTALL com.google.android.inputmethod.latin  # Gboard
# $UNINSTALL com.google.android.tts               # Google TTS
# $UNINSTALL com.google.android.apps.wellbeing     # Digital Wellbeing
# $UNINSTALL com.google.android.apps.safetyhub     # Safety Hub
# $UNINSTALL com.google.android.healthconnect.controller
# $UNINSTALL com.google.android.apps.healthdata
# $UNINSTALL com.google.android.federatedcompute
# $UNINSTALL com.google.android.adservices.api     # Ad Services
# $UNINSTALL com.google.mainline.adservices
# $UNINSTALL com.google.android.gms.location.history
# $UNINSTALL com.google.android.ondevicepersonalization.services
# $UNINSTALL com.google.android.projection.gearhead  # Android Auto
# $UNINSTALL com.google.android.apps.subscriptions.red  # Google One
# $UNINSTALL com.google.mainline.telemetry
# $UNINSTALL com.google.ambient.streaming

# ----------------------------------------------------------------------------
# MISC BLOATWARE
# ----------------------------------------------------------------------------
echo "[*] Removing misc bloatware..."

$UNINSTALL com.android.egg                          # Android Easter egg
$UNINSTALL com.android.chrome                       # Chrome (if using other browser)
$UNINSTALL com.android.deskclock                    # MIUI Clock alternative
$UNINSTALL com.android.traceur                      # System tracer (debug)
$UNINSTALL com.android.calllogbackup
$UNINSTALL com.microsoftsdk.crossdeviceservicebroker
$UNINSTALL com.tencent.soter.soterserver            # Tencent auth service
$UNINSTALL com.android.thememanager                 # MIUI Theme store

echo ""
echo "========================================"
echo " Done! Reboot your device."
echo " adb reboot"
echo "========================================"
