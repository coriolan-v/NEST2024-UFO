Sub ParseAutoplayCommon(setupParams as object, setup_sync as object)
  
  setupParams.version = setup_sync.LookupMetadata("client", "version")

  setupParams.base = setup_sync.LookupMetadata("client", "base")
  setupParams.recoveryHandler = setup_sync.LookupMetadata("client", "recoveryHandler")
  setupParams.recoverySetup = setup_sync.LookupMetadata("client", "recoverySetup")
  setupParams.next = setup_sync.LookupMetadata("client", "next")
  setupParams.event = setup_sync.LookupMetadata("client", "event")
  setupParams.error = setup_sync.LookupMetadata("client", "error")
  setupParams.deviceError = setup_sync.LookupMetadata("client", "deviceError")
  setupParams.deviceDownload = setup_sync.LookupMetadata("client", "deviceDownload")
  setupParams.deviceDownloadProgress = setup_sync.LookupMetadata("client", "deviceDownloadProgress")
  setupParams.trafficDownload = setup_sync.LookupMetadata("client", "trafficDownload")
  setupParams.uploadLogs = setup_sync.LookupMetadata("client", "uploadLogs")
  setupParams.batteryCharger = setup_sync.LookupMetadata("client", "batteryCharger")
  
  setupParams.account = setup_sync.LookupMetadata("server", "account")
  setupParams.bsnRegistrationToken = setup_sync.LookupMetadata("server", "bsnRegistrationToken")
  setupParams.user = setup_sync.LookupMetadata("server", "user")
  setupParams.password = setup_sync.LookupMetadata("server", "password")
  setupParams.group = setup_sync.LookupMetadata("server", "group")
  setupParams.enableUnsafeAuthentication = setup_sync.LookupMetadata("server", "enableUnsafeAuthentication")
  
  setupParams.endpoints_s3Url = setup_sync.LookupMetadata("server", "endpoints_s3Url")
  setupParams.endpoints_provisionServer = setup_sync.LookupMetadata("server", "endpoints_provisionServer")
  setupParams.endpoints_bsnServer = setup_sync.LookupMetadata("server", "endpoints_bsnServer")
  setupParams.endpoints_websocketsDWS = setup_sync.LookupMetadata("server", "endpoints_websocketsDWS")
  setupParams.endpoints_bsnApiServer = setup_sync.LookupMetadata("server", "endpoints_bsnApiServer")
  setupParams.endpoints_certsServer = setup_sync.LookupMetadata("server", "endpoints_certsServer")

  setupParams.partnerUrl = setup_sync.LookupMetadata("server", "partnerUrl")
  
  setupParams.unitName$ = setup_sync.LookupMetadata("client", "unitName")
  setupParams.unitNamingMethod$ = setup_sync.LookupMetadata("client", "unitNamingMethod")
  setupParams.unitDescription$ = setup_sync.LookupMetadata("client", "unitDescription")
  setupParams.timezone$ = setup_sync.LookupMetadata("client", "timeZone")
  setupParams.timeServer$ = setup_sync.LookupMetadata("client", "timeServer")
  
  setupParams.remoteDwsEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "remoteDwsEnabled"))
  
  setupParams.dwsEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "dwsEnabled"))
  
  'NOTE: Using GetMetadata() for "dwsPassword" because LookupMetadata() returns "" for null
  setupParams.dwsPassword$ = setup_sync.GetMetadata("client").dwsPassword
  
  setupParams.lwsConfig$ = setup_sync.LookupMetadata("client", "lwsConfig")
  setupParams.lwsEnableUpdateNotifications = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "lwsEnableUpdateNotifications"))
  setupParams.lwsUserName$ = setup_sync.LookupMetadata("client", "lwsUserName")
  setupParams.lwsPassword$ = setup_sync.LookupMetadata("client", "lwsPassword")
  
  setupParams.bsnCloudEnabled = IsTruthy(setup_sync.LookupMetadata("client", "bsnCloudEnabled"))  
  
  ParseJsonLogging(setupParams, setup_sync)
  
  setupParams.enableRemoteSnapshot = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "deviceScreenShotsEnabled"))
  setupParams.remoteSnapshotInterval% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "deviceScreenShotsInterval"))
  setupParams.remoteSnapshotMaxImages% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "deviceScreenShotsCountLimit"))
  setupParams.remoteSnapshotJpegQualityLevel% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "deviceScreenShotsQuality"))
  setupParams.remoteSnapshotOrientation = setup_sync.LookupMetadata("client", "deviceScreenShotsOrientation")
  
  setupParams.useDHCP = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "useDHCP"))
  setupParams.rateLimitModeOutsideWindow = setup_sync.LookupMetadata("client", "rateLimitModeOutsideWindow")
  setupParams.rateLimitRateOutsideWindow = setup_sync.LookupMetadata("client", "rateLimitRateOutsideWindow")
  setupParams.rateLimitModeInWindow = setup_sync.LookupMetadata("client", "rateLimitModeInWindow")
  setupParams.rateLimitRateInWindow = setup_sync.LookupMetadata("client", "rateLimitRateInWindow")
  setupParams.rateLimitModeInitialDownloads = setup_sync.LookupMetadata("client", "rateLimitModeInitialDownloads")
  setupParams.rateLimitRateInitialDownloads = setup_sync.LookupMetadata("client", "rateLimitRateInitialDownloads")
  setupParams.uploadLogFilesAtBoot = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "uploadLogFilesAtBoot"))
  setupParams.uploadLogFilesAtSpecificTime = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "uploadLogFilesAtSpecificTime"))
  setupParams.uploadLogFilesTime% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "uploadLogFilesTime"))
  setupParams.idleScreenColor$ = setup_sync.LookupMetadata("client", "idleScreenColor")
  setupParams.lwsUserName$ = setup_sync.LookupMetadata("client", "lwsUserName")
  setupParams.lwsPassword$ = setup_sync.LookupMetadata("client", "lwsPassword")
  
  setupParams.specifyHostname = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "specifyHostname"))
  setupParams.hostName$ = setup_sync.LookupMetadata("client", "hostname")
  
  setupParams.useWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "useWireless"))
  setupParams.ssid$ = setup_sync.LookupMetadata("client", "ssid")
  setupParams.passphrase$ = setup_sync.LookupMetadata("client", "passphrase")
  
  setupParams.useProxy = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "useProxy"))
  setupParams.proxy$ = setup_sync.LookupMetadata("client", "proxy")
  setupParams.proxySpec$ = setupParams.proxy$

  if (setup_sync.GetMetadata("client").networkHosts <> invalid)
    setupParams.networkHosts = setup_sync.GetMetadata("client").networkHosts
  else
    setupParams.networkHosts = []
  end if
  
  setupParams.networkConnectionPriorityWired% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "networkConnectionPriorityWired"))
  setupParams.networkConnectionPriorityWireless% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "networkConnectionPriorityWireless"))
  setupParams.contentDataTypeEnabledWired = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "contentDataTypeEnabledWired"))
  setupParams.textFeedsDataTypeEnabledWired = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "textFeedsDataTypeEnabledWired"))
  setupParams.healthDataTypeEnabledWired = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "healthDataTypeEnabledWired"))
  setupParams.mediaFeedsDataTypeEnabledWired = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "mediaFeedsDataTypeEnabledWired"))
  setupParams.logUploadsXfersEnabledWired = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "logUploadsXfersEnabledWired"))
  setupParams.contentDataTypeEnabledWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "contentDataTypeEnabledWireless"))
  setupParams.textFeedsDataTypeEnabledWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "textFeedsDataTypeEnabledWireless"))
  setupParams.healthDataTypeEnabledWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "healthDataTypeEnabledWireless"))
  setupParams.mediaFeedsDataTypeEnabledWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "mediaFeedsDataTypeEnabledWireless"))
  setupParams.logUploadsXfersEnabledWireless = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "logUploadsXfersEnabledWireless"))
  setupParams.networkDiagnosticsEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "networkDiagnosticsEnabled"))
  setupParams.testEthernetEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "testEthernetEnabled"))
  setupParams.testWirelessEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "testWirelessEnabled"))
  setupParams.testInternetEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "testInternetEnabled"))
  setupParams.useCustomSplashScreen = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "useCustomSplashScreen"))
  
  setupParams.configVersion$ = setup_sync.LookupMetadata("client", "configVersion")
  
  setupParams.timeBetweenNetConnects% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "timeBetweenNetConnects"))
  
  setupParams.staticIPAddress = setup_sync.LookupMetadata("client", "staticIPAddress")
  setupParams.subnetMask = setup_sync.LookupMetadata("client", "subnetMask")
  setupParams.gateway = setup_sync.LookupMetadata("client", "gateway")
  setupParams.dns1 = setup_sync.LookupMetadata("client", "dns1")
  setupParams.dns2 = setup_sync.LookupMetadata("client", "dns2")
  setupParams.dns3 = setup_sync.LookupMetadata("client", "dns3")
  
  'WPA/802.1X Authentication Parameters
  if type(setup_sync.GetMetadata("client").wpaSettings) = "roAssociativeArray" then
    wpaSettings = setup_sync.GetMetadata("client").wpaSettings
    setupParams.enableWPAEnterpriseAuthentication = wpaSettings.enableWPAEnterpriseAuthentication
    setupParams.wpaEnterpriseVariant = wpaSettings.wpaEnterpriseVariant
    setupParams.eapCertificateType = wpaSettings.eapCertificateType
    setupParams.eapCertificatePassphrase = wpaSettings.eapCertificatePassphrase
    setupParams.peapUsername = wpaSettings.peapUsername
    setupParams.peapPassphrase = wpaSettings.peapPassphrase
    
    setupParams.eapCertificateFileName = ""
    setupParams.eapPemOrDerKeyFileName = ""
    setupParams.caCertificateFileName = ""

    if IsString(wpaSettings.eapCertificateFileName) and wpaSettings.eapCertificateFileName <> "" then
      setupParams.eapCertificateFileName = wpaSettings.eapCertificateFileName
    endif

    if IsString(wpaSettings.eapPemOrDerKeyFileName) and wpaSettings.eapPemOrDerKeyFileName <> "" then
      setupParams.eapPemOrDerKeyFileName = wpaSettings.eapPemOrDerKeyFileName
    endif

    if IsString(wpaSettings.caCertificateFileName) and wpaSettings.caCertificateFileName <> "" then
      setupParams.caCertificateFileName = wpaSettings.caCertificateFileName
    endif

  else
    setupParams.enableWPAEnterpriseAuthentication = false
  endif

  setupParams.useDHCP_2 = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "useDHCP_2"))
  
  setupParams.staticIPAddress_2 = setup_sync.LookupMetadata("client", "staticIPAddress_2")
  setupParams.subnetMask_2 = setup_sync.LookupMetadata("client", "subnetMask_2")
  setupParams.gateway_2 = setup_sync.LookupMetadata("client", "gateway_2")
  setupParams.dns1_2 = setup_sync.LookupMetadata("client", "dns1_2")
  setupParams.dns2_2 = setup_sync.LookupMetadata("client", "dns2_2")
  setupParams.dns3_2 = setup_sync.LookupMetadata("client", "dns3_2")
  
  'WPA/802.1X Authentication Parameters
  if type(setup_sync.GetMetadata("client").wpaSettings_2) = "roAssociativeArray" then
    wpaSettings = setup_sync.GetMetadata("client").wpaSettings_2
    setupParams.enableWPAEnterpriseAuthentication_2 = wpaSettings.enableWPAEnterpriseAuthentication
    setupParams.wpaEnterpriseVariant_2 = wpaSettings.wpaEnterpriseVariant
    setupParams.eapCertificateType_2 = wpaSettings.eapCertificateType
    setupParams.eapCertificatePassphrase_2 = wpaSettings.eapCertificatePassphrase
    setupParams.peapUsername_2 = wpaSettings.peapUsername
    setupParams.peapPassphrase_2 = wpaSettings.peapPassphrase
    
    setupParams.eapCertificateFileName_2 = ""
    setupParams.eapPemOrDerKeyFileName_2 = ""
    setupParams.caCertificateFileName_2 = ""

    if IsString(wpaSettings.eapCertificateFileName) and wpaSettings.eapCertificateFileName <> "" then
      setupParams.eapCertificateFileName_2 = wpaSettings.eapCertificateFileName
    endif

    if IsString(wpaSettings.eapPemOrDerKeyFileName) and wpaSettings.eapPemOrDerKeyFileName <> "" then
      setupParams.eapPemOrDerKeyFileName_2 = wpaSettings.eapPemOrDerKeyFileName
    endif

    if IsString(wpaSettings.caCertificateFileName) and wpaSettings.caCertificateFileName <> "" then
      setupParams.caCertificateFileName_2 = wpaSettings.caCertificateFileName
    endif

  else
    setupParams.enableWPAEnterpriseAuthentication_2 = false
  endif

  setupParams.rateLimitModeOutsideWindow_2 = setup_sync.LookupMetadata("client", "rateLimitModeOutsideWindow_2")
  setupParams.rateLimitRateOutsideWindow_2 = setup_sync.LookupMetadata("client", "rateLimitRateOutsideWindow_2")
  setupParams.rateLimitModeInWindow_2 = setup_sync.LookupMetadata("client", "rateLimitModeInWindow_2")
  setupParams.rateLimitRateInWindow_2 = setup_sync.LookupMetadata("client", "rateLimitRateInWindow_2")
  setupParams.rateLimitModeInitialDownloads_2 = setup_sync.LookupMetadata("client", "rateLimitModeInitialDownloads_2")
  setupParams.rateLimitRateInitialDownloads_2 = setup_sync.LookupMetadata("client", "rateLimitRateInitialDownloads_2")

  setupParams.uploadLogs = setup_sync.LookupMetadata("client", "uploadLogs")
  setupParams.uploadSnapshots = setup_sync.LookupMetadata("client", "uploadSnapshots")
  setupParams.contentDownloadsRestricted = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "contentDownloadsRestricted"))
  setupParams.contentDownloadRangeStart% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "contentDownloadRangeStart"))
  setupParams.contentDownloadRangeLength% = GetNumberFromNumericString(setup_sync.LookupMetadata("client", "contentDownloadRangeLength"))
  setupParams.usbUpdatePassword$ = setup_sync.LookupMetadata("client", "usbUpdatePassword")
  setupParams.brightWallName = setup_sync.LookupMetadata("client", "BrightWallName")
  setupParams.brightWallScreenNumber = setup_sync.LookupMetadata("client", "BrightWallScreenNumber")

  ' Set lower case setup type
  setupParams.setupType = lcase(setup_sync.LookupMetadata("client", "setupType"))

  ' BCN-6317. If inheritNetworkProperties is true, do not apply network settings
  setupParams.inheritNetworkProperties = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "inheritNetworkProperties"))
  
end sub


Sub CreateApplicationConnection(setupParams as object, msgPort as object, networkingRegistrySection as object)
  ' If we have a new enough system, use the control cloud access method for IPC
  ccloud = CreateObject("roControlCloud")
  if ccloud <> invalid then
    ccloud.SetUserData("bootstrap")
    ccloud.SetPort(msgPort)
    ' commented the follow as SendStatusPayload always called immediate after this function,
    ' which works as indicator to use application port as communication channel.
    ' if the order changed/function removed, we need to send an empty object.
    ' send an empty message indicate we'll use application port
    ' ccloud.SendMessage({})
    setupParams.ccloud = ccloud
  else 
    setupParams.dgSocket = CreateDatagramSocket(setupParams, msgPort, networkingRegistrySection)
  end if

  ' Maintain socket port to accept incoming udp message from bootstrap
  setupParams.wsUdpSocketPort$ = networkingRegistrySection.Read("wsUdpSocketPort")
  if setupParams.wsUdpSocketPort$ = "" then
    setupParams.wsUdpSocketPort% = 9999
  else
    setupParams.wsUdpSocketPort% = int(val(setupParams.wsUdpSocketPort$))
  end if

end sub


Function CreateDatagramSocket(setupParams as object, msgPort as object, networkingRegistrySection as object)
  ' open datagramSocket for setup scripts and bootstrap to communicate
  ' create object for bootstrap udp messages
  dgSocket = CreateObject("roDatagramSocket")
  setupParams.daUdpSocketPort$ = networkingRegistrySection.Read("daUdpSocketPort")
  
  if setupParams.daUdpSocketPort$ = "" then
    setupParams.daUdpSocketPort% = 8888
  else
    setupParams.daUdpSocketPort% = int(val(setupParams.daUdpSocketPort$))
  end if

  dgSocket.BindToLocalPort(setupParams.daUdpSocketPort%)
  dgSocket.SetUserData("bootstrap")
  dgSocket.SetPort(msgPort)

  return dgSocket

end function


Sub SendStatusPayload(setupParams as object, version as string)

  if setupParams.ccloud <> invalid then
    jsonArray = ConstructStatusPayload(version)
    result = setupParams.ccloud.SendMessage(jsonArray)

  else if setupParams.dgSocket <> invalid then
    jsonArray = ConstructStatusPayload(version)
    jsonString = FormatJson(jsonArray)
    result = setupParams.dgSocket.SendTo("127.0.0.1", setupParams.wsUdpSocketPort%, jsonString)
  end if

end sub


Function ConstructStatusPayload(version as string)

  ' use the same format as websocket messages
    ' Constructing jsonArray.payload.body.script
    script = CreateObject("roAssociativeArray")
    script.AddReplace("type", "Setup")
    script.AddReplace("version", version)

    ' Constructing jsonArray.payload.body
    body = CreateObject("roAssociativeArray")
    body.AddReplace("script", script)

    ' Constructing jsonArray.payload
    payload = CreateObject("roAssociativeArray")
    payload.AddReplace("route", "/v1/script-status")
    payload.AddReplace("body", body)
    
    ' Constructing jsonArray
    jsonArray = CreateObject("roAssociativeArray")
    jsonArray.AddReplace("payload", payload)

    return jsonArray

end function


Sub ParseJsonLogging(setupParams as object, setup_sync as object)
  
  setupParams.playbackLoggingEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "playbackLoggingEnabled"))
  setupParams.stateLoggingEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "stateLoggingEnabled"))
  setupParams.eventLoggingEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "eventLoggingEnabled"))
  setupParams.diagnosticLoggingEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "diagnosticLoggingEnabled"))
  setupParams.variableLoggingEnabled = GetBoolFromNumericString(setup_sync.LookupMetadata("client", "variableLoggingEnabled"))
  
end sub


Sub CheckStorageDeviceIsWritable()
  
  ' determine if the storage device is writable
  tmpFileName$ = "bs~69-96.txt"
  WriteAsciiFile(tmpFileName$, "1")
  readValue$ = ReadAsciiFile(tmpFileName$)
  if len(readValue$) = 1 and readValue$ = "1" then
    DeleteFile(tmpFileName$)
  else
    ' only display message if device supports video
    videoMode = CreateObject("roVideoMode")
    if type(videoMode) = "roVideoMode" then
      resX = videoMode.GetResX()
      resY = videoMode.GetResY()
      videoMode = invalid
      
      r = CreateObject("roRectangle", 0, 0, resX, resY)
      twParams = CreateObject("roAssociativeArray")
      twParams.LineCount = 1
      twParams.TextMode = 2
      twParams.Rotation = 0
      twParams.Alignment = 1
      tw = CreateObject("roTextWidget", r, 1, 2, twParams)
      tw.PushString("")
      tw.Show()
      
      r = CreateObject("roRectangle", 0, resY / 2 - resY / 32, resX, resY / 32)
      tw = CreateObject("roTextWidget", r, 1, 2, twParams)
      tw.PushString("The attached storage device is write protected.")
      tw.Show()
      
      r2 = CreateObject("roRectangle", 0, resY / 2, resX, resY / 32)
      tw2 = CreateObject("roTextWidget", r2, 1, 2, twParams)
      tw2.PushString("Remove it, enable writing, and reboot the device.")
      tw2.Show()
    end if
    
    msgPort = CreateObject("roMessagePort")
    msg = wait(0, msgPort)
  end if
  
end sub


' Note that the check only needed for series 4 and older models
' Series 5 and newer models should always support BSN.cloud so no need to check
Sub CheckFirmwareVersion()
  
  modelObject = CreateObject("roDeviceInfo")
  
  ' check to see whether or not the current firmware meets the minimum compatibility requirements
  ' note that the return value for the GetVersionNumber() method does not include any additional version numbers after the first three
  ' the calculation is major*65536 + minor*256 + build
  versionNumber% = modelObject.GetVersionNumber()
  
  if modelObject.GetFamily() = "pantera" then
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  else if modelObject.GetFamily() = "pagani" then
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  else if modelObject.GetFamily() = "impala" then
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  else if modelObject.GetFamily() = "malibu" then
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  else if modelObject.GetFamily() = "tiger" then
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  else ' no supported devices should hit this else
    minVersionNumber% = 524407
    minVersion$ = "8.0.119"
  end if
  
  if versionNumber% < minVersionNumber% then
    osUpgradeMsg$ = "Firmware needs to be upgraded to " + minVersion$ + " or greater"
    ' only display message if device supports video
    videoMode = CreateObject("roVideoMode")
    if type(videoMode) = "roVideoMode" then
      resX = videoMode.GetResX()
      resY = videoMode.GetResY()
      videoMode = invalid
      r = CreateObject("roRectangle", 0, resY / 2 - resY / 64, resX, resY / 32)
      twParams = CreateObject("roAssociativeArray")
      twParams.LineCount = 1
      twParams.TextMode = 2
      twParams.Rotation = 0
      twParams.Alignment = 1
      tw = CreateObject("roTextWidget", r, 1, 2, twParams)
      tw.PushString(osUpgradeMsg$)
      tw.Show()
    else
      ' for a model that doesn't support video, print the message instead
      systemLog = CreateObject("roSystemLog")
      systemLog.SendLine(osUpgradeMsg$)
    end if
    msgPort = CreateObject("roMessagePort")
    gpioPort = CreateObject("roGpioControlPort")
    gpioPort.SetPort(msgPort)
    while true
      msg = wait(0, msgPort)
      if type(msg) = "roGpioButton" and msg.GetInt() = 12 then
        stop
      end if
    end while
  end if
  
end sub


Sub ClearRegistryKeys(registrySection as object)
  
  ' Clear legacy registry keys
  registrySection.Delete("next")
  registrySection.Delete("event")
  registrySection.Delete("error")
  registrySection.Delete("deviceerror")
  registrySection.Delete("devicedownload")
  registrySection.Delete("recurl")
  registrySection.Delete("timezone")
  registrySection.Delete("unitName")
  registrySection.Delete("unitNamingMethod")
  registrySection.Delete("unitDescription")
  registrySection.Delete("timeBetweenNetConnects")
  registrySection.Delete("contentDownloadsRestricted")
  registrySection.Delete("contentDownloadRangeStart")
  registrySection.Delete("contentDownloadRangeLength")
  registrySection.Delete("useDHCP")
  registrySection.Delete("staticIPAddress")
  registrySection.Delete("subnetMask")
  registrySection.Delete("gateway")
  registrySection.Delete("broadcast")
  registrySection.Delete("dns1")
  registrySection.Delete("dns2")
  registrySection.Delete("dns3")
  registrySection.Delete("timeServer")
  registrySection.Delete("account")
  registrySection.Delete("user")
  registrySection.Delete("password")
  registrySection.Delete("group")
  
  ' Clear other keys in case they're no longer used
  ' If user specifies to inherit network properties,
  ' we do not delete previous network settings
  registrySection.Delete("uup")
  registrySection.Delete("cfv")
  
  registrySection.Delete("brightWallName")
  registrySection.Delete("brightWallScreenNumber")
  
  registrySection.Delete("beacon1")
  registrySection.Delete("beacon2")
  
  registrySection.Delete("susse")

  registrySection.Delete("su")

  'BCN-7431: prevent unexpected LFN setup workflow error, but still allow LFN support application setup
  registrySection.Delete("ru")
end sub


Sub ClearNetworkRegistryKeys(registrySection as object, inp as boolean)

  if not inp then

    registrySection.Delete("up")
    registrySection.Delete("ps")
    registrySection.Delete("bph")
    registrySection.Delete("ts")

    registrySection.Delete("wifi")
    registrySection.Delete("ss")
    registrySection.Delete("pp")

    registrySection.Delete("ncp")
    registrySection.Delete("ncp2")

    registrySection.Delete("cwr")
    registrySection.Delete("twr")
    registrySection.Delete("mwr")
    registrySection.Delete("hwr")
    registrySection.Delete("lwr")

    registrySection.Delete("cwf")
    registrySection.Delete("twf")
    registrySection.Delete("mwf")
    registrySection.Delete("hwf")
    registrySection.Delete("lwf")

    registrySection.Delete("sip")
    registrySection.Delete("sm")
    registrySection.Delete("gw")
    registrySection.Delete("d1")
    registrySection.Delete("d2")
    registrySection.Delete("d3")

    registrySection.Delete("sip2")
    registrySection.Delete("sm2")
    registrySection.Delete("gw2")
    registrySection.Delete("d12")
    registrySection.Delete("d22")
    registrySection.Delete("d32")

    registrySection.Delete("rlmid")
    registrySection.Delete("rlrid")
    registrySection.Delete("rlmow")
    registrySection.Delete("rlrow")
    registrySection.Delete("rlmiw")
    registrySection.Delete("rlriw")

    registrySection.Delete("rlmid2")
    registrySection.Delete("rlrid2")
    registrySection.Delete("rlmow2")
    registrySection.Delete("rlrow2")
    registrySection.Delete("rlmiw2")
    registrySection.Delete("rlriw2")

    registrySection.Delete("inp")
    registrySection.Delete("networkjson")

    registrySection.Delete("cdrs")
    registrySection.Delete("cdrl")

    'WPA Enterprise parameters
    registrySection.Delete("enableWPAEnterpriseAuthentication")
    registrySection.Delete("wpaEnterpriseVariant")
    registrySection.Delete("eapCertificateType")
    registrySection.Delete("eapCertificate")
    registrySection.Delete("eapPassphrase")
    registrySection.Delete("eapPemOrDerKey")
    registrySection.Delete("peapUsername")
    registrySection.Delete("peapPassphrase")
    registrySection.Delete("caCertificate")
    registrySection.Delete("enableWPAEnterpriseAuthentication2")
    registrySection.Delete("wpaEnterpriseVariant2")
    registrySection.Delete("eapCertificateType2")
    registrySection.Delete("eapCertificate2")
    registrySection.Delete("eapPassphrase2")
    registrySection.Delete("eapPemOrDerKey2")
    registrySection.Delete("peapUsername2")
    registrySection.Delete("peapPassphrase2")
    registrySection.Delete("caCertificate2")

  end if

end sub


Function RegistrationReset(registrySection as object)

  registration_flag = registrySection.Read("registered_with_bsn")
  registration_in_progress = registrySection.Read("registration_in_progress")

  ' if found registration flag set and it's the first time setup script rebooted
  ' means flag was left over from previous setup
  ' delete registered_with_bsn flag so that player can re-register
  if (IsTruthy(registration_flag) = true) and (not (IsTruthy(registration_in_progress) = true)) then
    registrySection.Delete("registered_with_bsn")
    registrySection.Delete("access_token")
    registrySection.Delete("access_token_expiration")
    registrySection.Delete("refresh_token")
    registrySection.Delete("bsnrt")
    registrySection.Delete("a")
    registrySection.Write("registration_in_progress", "yes")
    registrySection.Flush()
    return true
  end if

  return false

end function


Sub WriteRegistryVersion(registrySection as object, version as string)

  registrySection.Write("version", version)

End sub


Function GetRateLimits(setupParams as object, rateLimitModeKey$ as string, rateLimitRateKey$ as string)
  
  rateLimitModeSpec$ = setupParams[rateLimitModeKey$]
  
  rateLimitMode$ = "default"
  rateLimitRate$ = "0"
  rateLimitRate% = -1
  
  if rateLimitModeSpec$ = "unlimited" then
    rateLimitMode$ = "unlimited"
    rateLimitRate% = 0
  else if rateLimitModeSpec$ = "specified" then
    rateLimitMode$ = "specified"
    rateLimitRate$ = setupParams[rateLimitRateKey$]
    rateLimitRate% = int(val(rateLimitRate$))
  end if
  
  rateLimits = { }
  rateLimits.rateLimitMode$ = rateLimitMode$
  rateLimits.rateLimitRate$ = rateLimitRate$
  rateLimits.rateLimitRate% = rateLimitRate%
  
  return rateLimits
  
end function


Function SetNetworkConfiguration(interfaceNum% as integer, setupParams as object, registrySection as object, keySuffix$ as string, registrySuffix$ as string)
  
  networkingParameters = { }
  if setupParams.inheritNetworkProperties then
    nc = CreateObject("roNetworkConfiguration", interfaceNum%)

    useDHCP = true
    if type(nc) = "roNetworkConfiguration" then
      ' GetCurrentConfig().dhcp is of type roBoolean
      ' Doc: https://docs.brightsign.biz/display/DOC/roNetworkConfiguration#roNetworkConfiguration-GetCurrentConfig()AsObject
      useDHCP = nc.GetCurrentConfig().dhcp
    end if

    if useDHCP = false then
      currentConfig = nc.GetCurrentConfig()
      registrySection.Write("dhcp" + registrySuffix$, "no")
      registrySection.Write("sip" + registrySuffix$, currentConfig.ip4_address)
      registrySection.Write("sm" + registrySuffix$, currentConfig.ip4_netmask)
      registrySection.Write("gw" + registrySuffix$, currentConfig.ip4_gateway)
      ' dns_servers is an roArray of Strings
      dnsServers = currentConfig.dns_servers
      for i = 1 to 3
        currentDns = dnsServers[i-1]
        if IsString(currentDns) then
          registrySection.Write("d"+StripLeadingSpaces(stri(i))+registrySuffix$, currentDns)
        else
          registrySection.Write("d"+StripLeadingSpaces(stri(i))+registrySuffix$, "")
        end if
      next
    else
      registrySection.Write("dhcp" + registrySuffix$, "yes")
    end if

  else
    networkingParameters.useDHCP = setupParams["useDHCP" + keySuffix$]
    
    if not networkingParameters.useDHCP then
      networkingParameters.staticIPAddress$ = setupParams["staticIPAddress" + keySuffix$]
      networkingParameters.subnetMask$ = setupParams["subnetMask" + keySuffix$]
      networkingParameters.gateway$ = setupParams["gateway" + keySuffix$]
      networkingParameters.dns1$ = setupParams["dns1" + keySuffix$]
      networkingParameters.dns2$ = setupParams["dns2" + keySuffix$]
      networkingParameters.dns3$ = setupParams["dns3" + keySuffix$]
      
      registrySection.Write("dhcp" + registrySuffix$, "no")
      registrySection.Write("sip" + registrySuffix$, networkingParameters.staticIPAddress$)
      registrySection.Write("sm" + registrySuffix$, networkingParameters.subnetMask$)
      registrySection.Write("gw" + registrySuffix$, networkingParameters.gateway$)
      registrySection.Write("d1" + registrySuffix$, networkingParameters.dns1$)
      registrySection.Write("d2" + registrySuffix$, networkingParameters.dns2$)
      registrySection.Write("d3" + registrySuffix$, networkingParameters.dns3$)
    else
      registrySection.Write("dhcp" + registrySuffix$, "yes")
    end if
  end if
  
  rateLimits = GetRateLimits(setupParams, "rateLimitModeOutsideWindow" + keySuffix$, "rateLimitRateOutsideWindow" + keySuffix$)
  rlmow$ = rateLimits.rateLimitMode$
  rlrow$ = rateLimits.rateLimitRate$
  
  rateLimits = GetRateLimits(setupParams, "rateLimitModeInWindow" + keySuffix$, "rateLimitRateInWindow" + keySuffix$)
  rlmiw$ = rateLimits.rateLimitMode$
  rlriw$ = rateLimits.rateLimitRate$
  
  rateLimits = GetRateLimits(setupParams, "rateLimitModeInitialDownloads" + keySuffix$, "rateLimitRateInitialDownloads" + keySuffix$)
  rlmid$ = rateLimits.rateLimitMode$
  rlrid$ = rateLimits.rateLimitRate$
  networkingParameters.rl% = rateLimits.rateLimitRate%
  
  registrySection.Write("rlmow" + registrySuffix$, rlmow$)
  registrySection.Write("rlrow" + registrySuffix$, rlrow$)
  registrySection.Write("rlmiw" + registrySuffix$, rlmiw$)
  registrySection.Write("rlriw" + registrySuffix$, rlriw$)
  registrySection.Write("rlmid" + registrySuffix$, rlmid$)
  registrySection.Write("rlrid" + registrySuffix$, rlrid$)
  
  'WPA/802.1X Authentication Configuration
  networkingParameters.enableWPAEnterpriseAuthentication = setupParams["enableWPAEnterpriseAuthentication" + keySuffix$]
  registrySection.Write("enableWPAEnterpriseAuthentication" + registrySuffix$ , GetTrueFalseFromBoolean(networkingParameters.enableWPAEnterpriseAuthentication))
	  
  if networkingParameters.enableWPAEnterpriseAuthentication then

    networkingParameters.wpaEnterpriseVariant$ = setupParams["wpaEnterpriseVariant" + keySuffix$]
    registrySection.Write("wpaEnterpriseVariant" + registrySuffix$, networkingParameters.wpaEnterpriseVariant$)
		
    if networkingParameters.wpaEnterpriseVariant$ = "WPAEnterpriseEapTls" then
      networkingParameters.eapCertificateType$ = setupParams["eapCertificateType" + keySuffix$]
      registrySection.Write("eapCertificateType" + registrySuffix$, networkingParameters.eapCertificateType$)
      
      networkingParameters.eapCertificate = CreateObject("roByteArray")
      ok = networkingParameters.eapCertificate.ReadFile(setupParams["eapCertificateFileName" + keySuffix$])
      if ok then
        fileContents$ = networkingParameters.eapCertificate.ToBase64String()
        registrySection.Write("eapCertificate" + registrySuffix$, fileContents$)
      endif

      if networkingParameters.eapCertificateType$ = "WPAEapTlsPEMorDER" then
        networkingParameters.eapPemOrDerKey = CreateObject("roByteArray")
        ok = networkingParameters.eapPemOrDerKey.ReadFile(setupParams["eapPemOrDerKeyFileName" + keySuffix$])
        if ok then
          fileContents$ = networkingParameters.eapPemOrDerKey.ToBase64String()
          registrySection.Write("eapPemOrDerKey" + registrySuffix$, fileContents$)
        endif
      endif

      networkingParameters.eapPassphrase$ = setupParams["eapCertificatePassphrase" + keySuffix$]
      registrySection.Write("eapPassphrase" + registrySuffix$, networkingParameters.eapPassphrase$)
			
    else if networkingParameters.wpaEnterpriseVariant$ = "WPAEnterprisePeap" then
      networkingParameters.peapUsername$ = setupParams["peapUsername" + keySuffix$]
      networkingParameters.peapPassphrase$ = setupParams["peapPassphrase" + keySuffix$]
      registrySection.Write("peapUsername" + registrySuffix$, networkingParameters.peapUsername$)
      registrySection.Write("peapPassphrase" + registrySuffix$, networkingParameters.peapPassphrase$)
    endif
		
    networkingParameters.isCaCertificate = false
    networkingParameters.caCertificate = CreateObject("roByteArray")
    ok = networkingParameters.caCertificate.ReadFile(setupParams["caCertificateFileName" + keySuffix$])

    if ok then
      fileContents$ = networkingParameters.caCertificate.ToBase64String()
      if len(fileContents$) > 0 then
        registrySection.Write("caCertificate" + registrySuffix$, fileContents$)
        networkingParameters.isCaCertificate = true
      endif
    endif

    if networkingParameters.isCaCertificate then
      registrySection.Write("isCaCertificate" + registrySuffix$, "True")
    else
      registrySection.Write("isCaCertificate" + registrySuffix$, "False")
    endif

  endif
  
  return networkingParameters
  
end function


Sub SetLogging(setupParams as object, registrySection as object)
  
  if type(registrySection) = "roRegistrySection" then
    registrySection.Write("ple", GetYesNoFromBoolean(setupParams.playbackLoggingEnabled))
    registrySection.Write("ele", GetYesNoFromBoolean(setupParams.eventLoggingEnabled))
    registrySection.Write("sle", GetYesNoFromBoolean(setupParams.stateLoggingEnabled))
    registrySection.Write("dle", GetYesNoFromBoolean(setupParams.diagnosticLoggingEnabled))
    registrySection.Write("vle", GetYesNoFromBoolean(setupParams.variableLoggingEnabled))
    registrySection.Write("uab", GetYesNoFromBoolean(setupParams.uploadLogFilesAtBoot))
    registrySection.Write("uat", GetYesNoFromBoolean(setupParams.uploadLogFilesAtSpecificTime))
    registrySection.Write("ut", GetNumericStringFromNumber(setupParams.uploadLogFilesTime%))
  end if
  
end sub


Function GetModelSupportsWifi()
  
  modelSupportsWifi = false
  nc = CreateObject("roNetworkConfiguration", 1)
  if type(nc) = "roNetworkConfiguration" then
    currentConfig = nc.GetCurrentConfig()
    if type(currentConfig) = "roAssociativeArray" then
      modelSupportsWifi = true
    end if
  end if
  nc = invalid
  return modelSupportsWifi
  
end function


Sub SetLWS(setupParams as object, registrySection as object)
  
  ' delete obsolete lws keys
  registrySection.Delete("lws")
  registrySection.Delete("lwsu")
  registrySection.Delete("lwsp")
  
  ' local web server
  if setupParams.lwsConfig$ = "content" or setupParams.lwsConfig$ = "status" then
    registrySection.Write("nlws", Left(setupParams.lwsConfig$, 1))
    registrySection.Write("nlwsu", setupParams.lwsUserName$)
    registrySection.Write("nlwsp", setupParams.lwsPassword$)
    registrySection.Write("nlwseun", GetYesNoFromBoolean(setupParams.lwsEnableUpdateNotifications))
  else
    registrySection.Delete("nlws")
    registrySection.Delete("nlwsu")
    registrySection.Delete("nlwsp")
    registrySection.Delete("nlwseun")
  end if
  
end sub


Sub SetHostname(specifyHostname as boolean, hostname$ as string)
  
  if specifyHostname then
    
    nc = CreateObject("roNetworkConfiguration", 0)
    
    if type(nc) <> "roNetworkConfiguration" then
      nc = CreateObject("roNetworkConfiguration", 1)
    end if
    
    if type(nc) = "roNetworkConfiguration" then
      ok = nc.SetHostname(hostname$)
      if ok then 
        nc.Apply()
      endif
      nc = invalid
    end if
  end if
  
end sub


Sub SetDWS(setupParams as object, registrySection as object)
  
  ' diagnostic web server
  
  dwsAA = CreateObject("roAssociativeArray")
  di = CreateObject("roDeviceInfo")
  deviceSerial$ = di.GetDeviceUniqueId()
  if setupParams.dwsEnabled or setupParams.remoteDwsEnabled then
    dwsAA["port"] = "80"
    if setupParams.dwsPassword$ = "§default" then
      ' Using "open" parameter here since serial is not encrypted.
      ' See https://brightsign.atlassian.net/wiki/spaces/DOC/pages/370673153/roNetworkConfiguration#roNetworkConfiguration-SetupDWS(settingsAsroAssociativeArray)AsBoolean
      ' for details.
      dwsAA["open"] = deviceSerial$
    else
      dwsAA["password"] = setupParams.dwsPassword$ 'also covers "" case
    end if
  else
    dwsAA["port"] = 0
  end if
  
  ' Set the old registry to see if dws or remotedws values are switched
  dwseRegistry = registrySection.Read("dwse")
  rdwseRegistry = registrySection.Read("rdwse")
  
  registrySection.Write("rdwse", GetYesNoFromBoolean(setupParams.remoteDwsEnabled))
  registrySection.Write("dwse", GetYesNoFromBoolean(setupParams.dwsEnabled))

  if setupParams.dwsPassword$ = "§default" then
    registrySection.Write("dwsp", deviceSerial$)
  else
    registrySection.Write("dwsp", setupParams.dwsPassword$)
  end if
  
  ' set DWS on device
  nc = CreateObject("roNetworkConfiguration", 0)
  
  if type(nc) <> "roNetworkConfiguration" then
    nc = CreateObject("roNetworkConfiguration", 1)
  end if
  
  if type(nc) = "roNetworkConfiguration" then
    restartRequired = nc.SetupDWS(dwsAA)
    ' Will put a RestartApplication() at the end of setup if setupParams.restartRequired = true.
    ' Unnecessary reboot for BSN/LFN/SFN. Refactor reboot throughout autorun for device setup
    if restartRequired then setupParams.restartRequired = true
    if dwseRegistry <> GetYesNoFromBoolean(setupParams.dwsEnabled) or rdwseRegistry <> GetYesNoFromBoolean(setupParams.remoteDwsEnabled) then
      setupParams.restartRequired = true
    end if
  end if
  
end sub


Sub ConfigureEthernet(ethernetNetworkingParameters as object, networkConnectionPriorityWired% as integer, timeServer$ as string, proxySpec$ as string, bypassProxyHosts as object, featureMinRevs as object)
  nc = CreateObject("roNetworkConfiguration", 0)
  if type(nc) = "roNetworkConfiguration" then
    nc.ResetInterfaceSettings()
    ConfigureNetwork(nc, ethernetNetworkingParameters, networkConnectionPriorityWired%, timeServer$, proxySpec$, bypassProxyHosts, featureMinRevs)
  else
    print "Unable to create roNetworkConfiguration - index = 0"
  end if
end sub


Sub ConfigureWifi(wifiNetworkingParameters as object, ssid$ as string, passphrase$ as string, networkConnectionPriorityWireless% as integer, timeServer$ as string, proxySpec$ as string, bypassProxyHosts as object, featureMinRevs as object)

  nc = CreateObject("roNetworkConfiguration", 1)
  if type(nc) = "roNetworkConfiguration" then
    nc.ResetInterfaceSettings()
    nc.SetWiFiESSID(ssid$)
    nc.SetObfuscatedWifiPassphrase(passphrase$)
    ConfigureNetwork(nc, wifiNetworkingParameters, networkConnectionPriorityWireless%, timeServer$, proxySpec$, bypassProxyHosts, featureMinRevs)
  else
    print "Unable to create roNetworkConfiguration - index = 1"
  end if
end sub


Sub ConfigureNetwork(nc as object, networkingParameters as object, networkConnectionPriority% as integer, timeServer$ as string, proxySpec$ as string, bypassProxyHosts as object, featureMinRevs as object)
  
  if not networkingParameters.useDHCP then
    nc.SetIP4Address(networkingParameters.staticIPAddress$)
    nc.SetIP4Netmask(networkingParameters.subnetMask$)
    nc.SetIP4Gateway(networkingParameters.gateway$)
    if networkingParameters.dns1$ <> "" then nc.AddDNSServer(networkingParameters.dns1$)
    if networkingParameters.dns2$ <> "" then nc.AddDNSServer(networkingParameters.dns2$)
    if networkingParameters.dns3$ <> "" then nc.AddDNSServer(networkingParameters.dns3$)
  else
    nc.SetDHCP()
  end if
  
  nc.SetRoutingMetric(networkConnectionPriority%)
  nc.SetTimeServer(timeServer$)
  nc.SetProxy(proxySpec$)
  
  ok = nc.SetProxyBypass(bypassProxyHosts)
  
  nc.SetInboundShaperRate(networkingParameters.rl%)

  success = nc.Apply()
  
  ConfigureWPANetwork(nc, networkingParameters)

end sub


Sub ConfigureEthernetWPA(ethernetNetworkingParameters as object)

  nc = CreateObject("roNetworkConfiguration", 0)
  if type(nc) = "roNetworkConfiguration" then
    ConfigureWPANetwork(nc, ethernetNetworkingParameters)
  else
    print "Unable to create roNetworkConfiguration - index = 0"
  end if

end sub


Sub ConfigureWifiWPA(wifiNetworkingParameters as object)

  nc = CreateObject("roNetworkConfiguration", 1)
  if type(nc) = "roNetworkConfiguration" then
    ConfigureWPANetwork(nc, wifiNetworkingParameters)
  else
    print "Unable to create roNetworkConfiguration - index = 1"
  end if

end sub


Sub ConfigureWPANetwork(nc as object, networkingParameters as object)

  if networkingParameters.enableWPAEnterpriseAuthentication then
  
    if networkingParameters.wpaEnterpriseVariant$ = "WPAEnterpriseEapTls" then

      'EAP-TLS
      if networkingParameters.eapCertificateType$ = "WPAEapTlsPKCS" then
        'PKCS#12
        ok = nc.SetWiFiClientCertificate("")
        ok = nc.SetWiFiPrivateKey(networkingParameters.eapCertificate)
      else if networkingParameters.eapCertificateType$ = "WPAEapTlsPEMorDER" then
        'X.509
        ok = nc.SetWiFiClientCertificate(networkingParameters.eapCertificate)
        ok = nc.SetWiFiPrivateKey(networkingParameters.eapPemOrDerKey)
      endif
      'optional passphrase for any of the above certificates
      if networkingParameters.eapPassphrase$ <> "" then
        nc.SetObfuscatedWiFiPassphrase(networkingParameters.eapPassphrase$)
      endif
    else if networkingParameters.wpaEnterpriseVariant$ = "WPAEnterprisePeap" then
      'PEAP
      nc.SetWiFiIdentity(networkingParameters.peapUsername$)
      if networkingParameters.peapPassphrase$ <> "" then
        nc.SetObfuscatedWiFiPassphrase(networkingParameters.peapPassphrase$)
      endif
    endif

    if networkingParameters.isCaCertificate = true then
      'CA
      nc.SetWiFiCACertificates(networkingParameters.caCertificate)
    endif

    success = nc.Apply()

  endif

end sub


Sub DisableWireless()
  nc = CreateObject("roNetworkConfiguration", 1)
  if type(nc) = "roNetworkConfiguration" then
    nc.SetDHCP()
    nc.SetWiFiESSID("")
    nc.SetObfuscatedWifiPassphrase("")
    nc.SetWiFiIdentity("")
    nc.SetWiFiCaCertificates("")
    nc.SetWiFiClientCertificate("")
    nc.SetWiFiPrivateKey("")
    nc.SetWiFiPassphrase("")
    nc.Apply()
  end if
end sub


Sub SetWiredParameters(setupParams as object, registrySection as object, useWireless as boolean)
  
  if useWireless then
    if setupParams.inheritNetworkProperties then
      ' get wired priority from OS
      nc0 = CreateObject("roNetworkConfiguration", 0)
      if type(nc0) = "roNetworkConfiguration" then
        registrySection.Write("ncp", GetNumericStringFromNumber(nc0.GetCurrentConfig().metric))
        ' Content data types enabled keep previous settings
      end if
    else
      registrySection.Write("ncp", GetNumericStringFromNumber(setupParams.networkConnectionPriorityWired%))
      registrySection.Write("cwr", GetTrueFalseFromBoolean(setupParams.contentDataTypeEnabledWired))
      registrySection.Write("twr", GetTrueFalseFromBoolean(setupParams.textFeedsDataTypeEnabledWired))
      registrySection.Write("hwr", GetTrueFalseFromBoolean(setupParams.healthDataTypeEnabledWired))
      registrySection.Write("mwr", GetTrueFalseFromBoolean(setupParams.mediaFeedsDataTypeEnabledWired))
      registrySection.Write("lwr", GetTrueFalseFromBoolean(setupParams.logUploadsXfersEnabledWired))
    end if
  else
    registrySection.Write("ncp", "0")
    registrySection.Write("cwr", "True")
    registrySection.Write("twr", "True")
    registrySection.Write("hwr", "True")
    registrySection.Write("mwr", "True")
    registrySection.Write("lwr", "True")
  end if
  
end sub


Function SetWirelessParameters(setupParams as object, registrySection as object, modelSupportsWifi as boolean) as boolean

  if setupParams.useWireless and modelSupportsWifi then
    registrySection.Write("wifi", "yes")
    registrySection.Write("ss", setupParams.ssid$)
    registrySection.Write("pp", setupParams.passphrase$)
    
    registrySection.Write("ncp2", GetNumericStringFromNumber(setupParams.networkConnectionPriorityWireless%))
    registrySection.Write("cwf", GetTrueFalseFromBoolean(setupParams.contentDataTypeEnabledWireless))
    registrySection.Write("twf", GetTrueFalseFromBoolean(setupParams.textFeedsDataTypeEnabledWireless))
    registrySection.Write("hwf", GetTrueFalseFromBoolean(setupParams.healthDataTypeEnabledWireless))
    registrySection.Write("mwf", GetTrueFalseFromBoolean(setupParams.mediaFeedsDataTypeEnabledWireless))
    registrySection.Write("lwf", GetTrueFalseFromBoolean(setupParams.logUploadsXfersEnabledWireless))
    return true
  end if

  registrySection.Write("wifi", "no")
  return false
  
end function

Function GetWirelessParametersInheritNetworkProperties(setupParams as object, registrySection as object, modelSupportsWifi as boolean, checkINPWifiConnectionTimerCount as integer) as string
  
  setupParams.useWireless = IsWifiConnected()

  if modelSupportsWifi and checkINPWifiConnectionTimerCount < 3 then
    if setupParams.useWireless then
      registrySection.Write("wifi", "yes")

      ' get wireless priority from OS
      nc1 = CreateObject("roNetworkConfiguration", 1)
      if type(nc1) = "roNetworkConfiguration" then
        ' TODO: overwrite wifi ssid and passpharse in registry once OS-11064 is ready to return wifi passphrase
        ' registrySection.Write("ss", nc1.GetWiFiESSID())
        ' registrySection.Write("pp", nc1.??())
        registrySection.Write("ncp2", GetNumericStringFromNumber(nc1.GetCurrentConfig().metric))
      end if
      ' Content data types enabled keep previous settings
      return "wifiConnected"
    else
      wifiPreviouslySet = registrySection.read("wifi")
      ssidPreviouslySet = registrySection.read("ss")
      if wifiPreviouslySet = "yes" and ssidPreviouslySet <> "" then
        return "wifiConnectionPending"
      end if
    end if
  end if
  print "Unable to inherit Wifi configuration, disabling Wifi"
  registrySection.Write("wifi", "no")
  return "wifiCantConnect"

End Function

Function IsWifiConnected() as boolean
    ' Wifi interface
    wifiAvailable = false
    nc1 = CreateObject("roNetworkConfiguration", 1)

    if type(nc1) = "roNetworkConfiguration" then

      wifiConfig = nc1.GetCurrentConfig()
      if (wifiConfig.DoesExist("ip4_address")) then
        wifiIpAddressAvailable = (wifiConfig.Lookup("ip4_address") <> "")
      else
        wifiIpAddressAvailable = false
      end if

      if (wifiConfig.DoesExist("link")) then
        wifiLinkAvailable = wifiConfig.Lookup("link")
      end if

      wifiAvailable = (wifiIpAddressAvailable and wifiLinkAvailable)
    end if

    return wifiAvailable

end function


Function SetNetworkConfigurationInterfaces(setupParams as object, registrySection as object, useWireless as boolean, modelSupportsWifi as boolean)
  
  networkConfigurationInterfaces = {}

  ' Network configurations
  if useWireless then
    if modelSupportsWifi then
      networkConfigurationInterfaces.wifiNetworkingParameters = SetNetworkConfiguration(1, setupParams, registrySection, "", "")
      networkConfigurationInterfaces. ethernetNetworkingParameters = SetNetworkConfiguration(0, setupParams, registrySection, "_2", "2")
    else
      ' if the user specified wireless but the system doesn't support it, use the parameters specified for wired (the secondary parameters)
      networkConfigurationInterfaces.ethernetNetworkingParameters = SetNetworkConfiguration(0, setupParams, registrySection, "_2", "")
    end if
  else
    networkConfigurationInterfaces.ethernetNetworkingParameters = SetNetworkConfiguration(0, setupParams, registrySection, "", "")
  end if

  ' registry writes complete - flush it
  registrySection.Flush()

  return networkConfigurationInterfaces

End Function


' B-Deploy use case: recovery url might be present for non-BSN setup types
Sub SetRecoveryHandlerUrl(setupParams as object, registrySection as object)
  if IsString(setupParams.recoveryHandler) and setupParams.recoveryHandler <> "" then
    registrySection.Write("ru", setupParams.recoveryHandler)
  end if
End Sub


Function GetProxy(setupParams as object, registrySection as object) as string
  
  proxySpec$ = ""
  if setupParams.inheritNetworkProperties then

    nc = CreateObject("roNetworkConfiguration", 0)
    if type(nc) = "roNetworkConfiguration" then
      proxySpec$ = nc.GetProxy()
      if IsString(proxySpec$) and proxySpec$ <> "" then
        registrySection.Write("up", "yes")
        registrySection.Write("ps", proxySpec$)
        return proxySpec$
      end if
    end if

  else
    if setupParams.useProxy then
      
      proxySpec$ = ""
      registrySection.Write("up", "yes")
      registrySection.Write("ps", setupParams.proxySpec$)
      
      return setupParams.proxySpec$
      
    end if
  
  end if
  
  registrySection.Write("up", "no")
  return ""
  
end function


Function GetBypassProxyHosts(proxySpec$ as string, setupParams as object) as object
  
  bypassProxyHosts = []
  
  if proxySpec$ <> "" then
    
    for each networkHost in setupParams.networkHosts
      ParseProxyBypass(bypassProxyHosts, networkHost)
    next
    
  end if
  
  return bypassProxyHosts
  
end function


Sub ParseProxyBypass(bypassProxyHosts as object, networkHost as object)
  
  if networkHost.BypassProxy then
    hostName$ = networkHost.HostName
    if hostName$ <> "" then
      bypassProxyHosts.push(hostName$)
    end if
  end if
  
end sub


Sub WriteTimeServer(setupParams as object, registrySection as object)
  if setupParams.inheritNetworkProperties then
    ' Time server
    nc = CreateObject("roNetworkConfiguration", 0)
    if type(nc) = "roNetworkConfiguration" then
      timeServer = nc.GetTimeServer()
      if IsString(timeServer) and timeServer <> "" then
        ' apply time server in the case after factory reset
        if timeServer = "default://" then
          timeServer = "ntp://time.brightsignnetwork.com"
          nc.SetTimeServer(timeServer)
          nc.Apply()
        end if
        registrySection.Write("ts", timeServer)
        print "time server in setup script = ";timeServer
      end if
    end if
  else
    registrySection.Write("ts", setupParams.timeServer$)
    print "time server in setup script = ";setupParams.timeServer$
  end if
end sub


Function GetBinding(wiredTransferEnabled as boolean, wirelessTransferEnabled as boolean) as integer
  
  binding% = -1
  if wiredTransferEnabled <> wirelessTransferEnabled then
    if wiredTransferEnabled then
      binding% = 0
    else
      binding% = 1
    end if
  end if
  
  return binding%
  
end function


' Check not invalid, then check either true/false
Function IsTruthy(value)
  valueType = type(value)
  if valueType = "Boolean" or valueType = "roBoolean" then
    if value = true or value = True then
      return true
    else if value = false or value = False then
      return false
    end if
  else if valueType = "String" or valueType = "roString" then
    if value = "true" or value = "True" or value = "1" or value = "on" or value = "On" or value = "yes" or value = "Yes" then
      return true
    else if value = "false" or value = "False" or value = "0" or value = "off" or value = "Off" or value = "no" or value = "No" then
      return false
    end if
  else if valueType = "Integer" or valueType = "roInteger" then
    if value = 1 then
      return true
    else if value = 0 then
      return false
    end if
  end if
  return invalid
end function


Function GetBoolFromNumericString(value$ as string) as boolean
  if value$ = "1" then return true
  return false
end function


Function GetNumberFromNumericString(value$ as string) as integer
  return int(val(value$))
end function


Function GetYesNoFromBoolean(value as boolean) as string
  if value then return "yes"
  return "no"
end function


Function GetTrueFalseFromBoolean(value as boolean) as string
  if value then return "True"
  return "False"
end function


Function GetNumericStringFromNumber(value% as integer) as string
  return stri(value%)
end function


Function StripLeadingSpaces(inputString$ as string) as string
  
  while true
    if left(inputString$, 1) <> " " then return inputString$
    inputString$ = right(inputString$, len(inputString$) - 1)
  end while
  
  return inputString$
  
end function


' The pair function syncSpecValueFalse can be found in autoxml.brs
' only add this function because only it is being used in autorun-setup-simple-networking.brs
Function syncSpecValueTrue(syncSpecValue$) as boolean
  if lcase(syncSpecValue$) = "yes" or syncSpecValue$ = "1" or lcase(syncSpecValue$) = "true" then
    return true
  end if
  return false
end function

Sub ClearBsnce(supervisorRegistrySection As Object, bsnCloudEnabled)
  if IsTruthy(bsnCloudEnabled) = invalid or IsTruthy(bsnCloudEnabled) <> false then
    supervisorRegistrySection.Delete("bsnce")
  end if
end sub


Sub SetRemoteSnapshot(setupParams as object, registrySection as object)
  
  registrySection.Write("enableRemoteSnapshot", GetYesNoFromBoolean(setupParams.enableRemoteSnapshot))
  
  if setupParams.enableRemoteSnapshot then
    registrySection.Write("remoteSnapshotInterval", GetNumericStringFromNumber(setupParams.remoteSnapshotInterval%))
    registrySection.Write("remoteSnapshotMaxImages", GetNumericStringFromNumber(setupParams.remoteSnapshotMaxImages%))
    registrySection.Write("remoteSnapshotJpegQualityLevel", GetNumericStringFromNumber(setupParams.remoteSnapshotJpegQualityLevel%))

    ' remoteSnapshotDisplayPortrait changed to remoteSnapshotOrientation for BCN-6961
    orientation = setupParams.remoteSnapshotOrientation
    ' if remote snapshot orientation is not found in sync spec, use the default value "Landscape"
    if IsString(orientation) and orientation <> "" then
      registrySection.Write("remoteSnapshotOrientation", orientation)
    else
      registrySection.Write("remoteSnapshotOrientation", "Landscape")
    end if
  end if
  
end sub


Sub SetIdleColor(setupParams as object, registrySection as object)
  
  registrySection.Write("isc", setupParams.idleScreenColor$)
  
end sub


Function CreateDeviceSetupSplashScreen(headervalue as string, messagevalue as string, msgPort as object)
  
  filepath = ""
    
  filepath = "sys:/web-client/postDeviceSetupSplashScreen/dist/index.html"
  
  file = CreateObject("roReadFile", filepath)
  
  if file <> invalid then
    filepath = "file:/" + filepath
    
    videoMode = CreateObject("roVideoMode")
    resX = videoMode.GetResX()
    resY = videoMode.GetResY()
    r = CreateObject("roRectangle", 0, 0, resX, resY)
    config = {
      url: filepath
      brightsign_js_objects_enabled: true
      nodejs_enabled: true
    }
    htmlWidget = CreateObject("roHtmlWidget", r, config)
    if type(htmlWidget) = "roHtmlWidget" then
      htmlWidget.SetPort(msgPort)
      htmlWidget.AllowJavascriptUrls({ all: "*" })
      htmlWidget.EnableJavascript(true)
      sleep(5000)
      
      htmlWidget.PostJSMessage({
        htmlcommand: "setupsplashscreenmessage",
        headermsg: headervalue,
        message: messagevalue
      })
      htmlWidget.Show()
      sleep(5000)
      return htmlWidget
    else
      stop
    end if
  end if
  'endif
  
  return invalid
  
end function


Function UpdateSplashScreenMessage(headervalue as string, messagevalue as string, htmlWidget as object)
  htmlWidget.PostJSMessage({
    htmlcommand: "setupsplashscreenmessage",
    headermsg: headervalue,
    message: messagevalue
  })

  return htmlWidget
end function


Function SetDeviceSplashScreenMessageByType(deviceSplashScreen as object, msgType as string, msgPort as object)
  headervalue = ""
  messagevalue = ""
  if msgType = "sfn_complete" then
    headervalue = "Congratulations, your BrightSign player is set up!"
    messagevalue = "Use BrightAuthor:connected to publish content via the Web Folder mode."
  else if msgType = "sfn_error"
    headervalue = "Failed to connect to the Web Folder."
    messagevalue = "Please confirm that the Web Folder is accessible and that the Web Folder URL was correctly entered during player setup."
  else if msgType = "standalone_complete" then
    headervalue = "Congratulations, your BrightSign player is set up!"
    messagevalue = "Use BrightAuthor:connected to publish content to a MicroSD card. Then, insert the card into the player."
  else if msgType = "no_application_url" then
    headervalue = "Cannot find the App URL while setting up the Partner App."
    messagevalue = "Please confirm that the App URL was correctly entered during player setup."
  else if msgType = "network_setup_failure" then
    headervalue = "Network setup failure"
    messagevalue = "Please visit support.brightsign.biz to contact BrightSign Tech Support."
  else if (msgType.left(12) = "unknown_type") then
    setupType = msgType.right(msgType.len()-13)
    headervalue = "Unknown setup type"
    messagevalue = "Cannot recognize the setup type: "+setupType
  else if (msgType.right(10) = "initialize") then
    setupType = msgType.left(msgType.len()-11)
    if setupType = "bsn" then
      headervalue = "BSN.cloud setup is in progress..."
    else if setupType = "sfn" then
      headervalue = "Web Folder setup is in progress..."
    else if setupType = "lfn" then
      headervalue = "Local Network setup is in progress..."
    else if setupType = "standalone" then
      headervalue = "Standalone setup is in progress..."
    else if setupType = "partnerapplication"
      headervalue = "Partner App setup is in progress..."
    else
      headervalue = "Player setup is in progress..."
    end if
    messagevalue = "Please wait for the player setup to finish. Do not unplug or reboot the player."
  end if

  if headervalue <> "" and messagevalue <> "" then
    if deviceSplashScreen = invalid then
      return CreateDeviceSetupSplashScreen(headervalue, messagevalue, msgPort)
    else
      return UpdateSplashScreenMessage(headervalue, messagevalue, deviceSplashScreen)
    end if
  else
    return invalid
  end if

end function


Sub SetCustomSplashScreen(setupParams as object, registrySection as object, featureMinRevs as object)
  
  deviceCustomization = CreateObject("roDeviceCustomization")
  
  if setupParams.useCustomSplashScreen then
    ok = deviceCustomization.WriteSplashScreen("customSplashScreen")
  else
    ok = deviceCustomization.WriteSplashScreen("")
  end if
  
end sub


Sub SetBeacons(spec as object, registrySection as object, featureMinRevs as object)
  
  return
  
  ''		for n = 1 to 2
  ''			key$ = "beacon" + Mid(stri(n),2)
  ''			beaconJson = GetEntry(spec, key$)
  ''			if Len(beaconJson) > 0 then
  ''				registrySection.Write(key$, beaconJson)
  ''			endif
  ''		next
  
end sub


Function ParseFeatureMinRevs() as object
  
  featureMinRevs = { }
  
  path$ = "featureMinRevs.json"
  featureMinRevs$ = ReadAsciiFile(path$)
  
  if len(featureMinRevs$) > 0 then
    
    publishedFeatureMinRevs = ParseJson(featureMinRevs$)
    
    ' verify that this is a valid FeatureMinRevs Json file
    if type(publishedFeatureMinRevs.FeatureMinRevs) <> "roAssociativeArray" then print "Invalid FeatureMinRevs JSON file - name not FeatureMinRevs" : stop
    if not IsString(publishedFeatureMinRevs.FeatureMinRevs.version) then print "Invalid FeatureMinRevs JSON file - version not found" : stop
    
    for each featureAA in publishedFeatureMinRevs.FeatureMinRevs.features
      featureName$ = featureAA.name
      minRev$ = featureAA.minFWRev
      featureMinRevs.AddReplace(featureName$, minRev$)
    next
    
  end if
  
  return featureMinRevs
  
end function


Function IsFeatureSupported(featureName$ as string, featureMinRevs as object) as boolean
  
  modelObject = CreateObject("roDeviceInfo")
  fwVersion$ = modelObject.GetVersion()
  
  featureExists = featureMinRevs.DoesExist(featureName$)
  if featureExists then
    featureMinFWRev = featureMinRevs[featureName$]
    featureMinFWRevVSFWVersion% = CompareFirmwareVersions(featureMinFWRev, fwVersion$)
    if featureMinFWRevVSFWVersion% <= 0 then
      return true
    end if
  end if
  
  return false
  
end function


Function CompareFirmwareVersions(a$ as string, b$ as string) as integer
  
  start_a% = 0
  start_b% = 0
  
  while true
    
    if start_a% >= len(a$) then
      if start_b% >= len(b$) then
        return 0
      else
        return -1
      end if
    else if start_b% >= len(b$) then
      return 1
    end if
    
    aChar$ = mid(a$, start_a% + 1, 1)
    a_digit = IsDigit(aChar$)
    
    bChar$ = mid(b$, start_b% + 1, 1)
    b_digit = IsDigit(bChar$)
    
    if a_digit and b_digit then
      
      ' Now we need to find the end of each of the sequences of digits.
      aa = { }
      aa.index = start_a%
      a_number% = ReadDigits(a$, aa)
      start_a% = aa.index
      
      bb = { }
      bb.index = start_b%
      b_number% = ReadDigits(b$, bb)
      start_b% = bb.index
      
      if a_number% < b_number% then
        return -1
      else if a_number% > b_number% then
        return 1
      end if
    else if a_digit then
      ' The first string has a digit but the second one has a
      ' non-digit so it must be greater.
      return 1
    else if b_digit then
      return -1
    else
      aChar$ = mid(a$, start_a% + 1, 1)
      bChar$ = mid(b$, start_b% + 1, 1)
      
      if asc(aChar$) < asc(bChar$) then
        return -1
      else if asc(aChar$) > asc(bChar$)
        return 1
      end if
      
      ' Otherwise we've dealt with this character
      start_a% = start_a% + 1
      start_b% = start_b% + 1
    end if
  end while
  
end function


Function IsDigit(a$ as string) as boolean
  
  if asc(a$) >= 48 and asc(a$) <= 57 then
    return true
  else
    return false
  end if
  
end function


Function ReadDigits(s$ as string, aa as object) as integer
  
  value% = 0
  
  index% = aa.index
  
  sChar$ = mid(s$, index% + 1, 1)
  
  while index% < len(s$) and IsDigit(sChar$)
    
    new_value% = value% * 10 + asc(sChar$) - asc("0")
    index% = index% + 1
    
    value% = new_value%
    
    if len(s$) > index% then
      sChar$ = mid(s$, index% + 1, 1)
    end if
    
  end while
  
  aa.index = index%
  return value%
  
end function


Sub SetBsnCloudParameters(setupParams as object, registrySection as object)

  if setupParams.account <> "" and setupParams.group <> "" and setupParams.bsnRegistrationToken <> "" then
    registrySection.Write("a", setupParams.account)
    registrySection.Write("g", setupParams.group)
    registrySection.Write("bsnrt", setupParams.bsnRegistrationToken)
    registrySection.Write("endpoints_s3Url", setupParams.endpoints_s3Url)
    registrySection.Write("endpoints_provisionServer", setupParams.endpoints_provisionServer)
    registrySection.Write("endpoints_bsnServer", setupParams.endpoints_bsnServer)
    registrySection.Write("endpoints_websocketsDWS", setupParams.endpoints_websocketsDWS)
    registrySection.Write("endpoints_bsnApiServer", setupParams.endpoints_bsnApiServer)
    registrySection.Write("endpoints_certsServer", setupParams.endpoints_certsServer)
  end if

end sub


Sub RestartIfNecessary(setupParams as object, restartScript as boolean)

  if setupParams.restartRequired <> invalid and setupParams.restartRequired = true then
    a = RestartApplication()
    stop
  else
    if restartScript then
      a = RestartScript()
      stop
    end if
  end if

end sub


Sub WaitRegistrationMessage(timerIntervalInSeconds as integer, proceedSignal as boolean, msgPort as object, port as integer)
  registrationResponseTimer= CreateObject("roTimer")
  registrationResponseTimer.SetPort(msgPort)
  ' Wait for reigstration response for a min
  registrationResponseTimer.SetElapsed(timerIntervalInSeconds, 0)
  registrationResponseTimer.Start()

  proceedAfterRegistrationProcessComplete = false
  ' ProceedSignal will be true when registered_with_bsn flag is set to yes
  if proceedSignal = true then
    proceedAfterRegistrationProcessComplete = true
  end if

  ' Registration process may be complete by:
  ' 1. a successful registration(flag is set or get udp/application message from supervisor) 
  ' 2. timeout occurring prior to receiving a successful message from the supervisor
  while not proceedAfterRegistrationProcessComplete
    msg = wait(0, msgPort)
    if type(msg) = "roTimerEvent" then
      if stri(msg.GetSourceIdentity()) = stri(registrationResponseTimer.GetIdentity()) then
        proceedAfterRegistrationProcessComplete = true
      end if
    else if type(msg) = "roDatagramEvent" and msg.GetSourcePort() = port and IsString(msg.GetUserData()) and msg.GetUserData() = "bootstrap" then
      payload = ParseJson(msg.GetString())
      if payload <> invalid and payload.message <> invalid and payload.message = "sync.registration.complete" then
        proceedAfterRegistrationProcessComplete = true
      end if
    else if type(msg) = "roControlCloudMessageEvent" and IsString(msg.GetUserData()) and msg.GetUserData() = "bootstrap" then
      jsonobject = ParseJson(msg.GetData())
      if jsonobject <> invalid and jsonobject.message <> invalid and jsonobject.message = "sync.registration.complete" then
        proceedAfterRegistrationProcessComplete = true
      end if
    end if
  end while

end sub


Function GetSupervisorSupportsConfigureNetwork(msgPort as object) as boolean

  url = CreateObject("roUrlTransfer")
  bootstrapRestBase = "http://127.0.0.1"
  registrationRequestUrl = bootstrapRestBase + "/api/v1/system/supervisor/registration"

  url.SetUrl(registrationRequestUrl)
  url.SetPort(msgPort)
  url.SetProxyBypass(["127.0.0.1", "localhost"]) ' BCN-8732

  result = url.GetToString()
  if result <> "" then
    payload = ParseJson(result)
    if type(payload) = "roAssociativeArray" and type(payload.data) = "roAssociativeArray" and type(payload.data.result) = "roAssociativeArray" then
      if type(payload.data.result.setupSupport) = "roAssociativeArray" and IsBoolean(payload.data.result.setupSupport.network) and payload.data.result.setupSupport.network then
        return true
      endif
    endif
  endif

  return false

end function


Function TriggerRegistrationRequest(registrySection as object, msgPort as object) as string

  url = CreateObject("roUrlTransfer")
  bootstrapRestBase = "http://127.0.0.1"
  registrationRequestUrl = bootstrapRestBase + "/api/v1/system/supervisor/registration"

  url.SetUrl(registrationRequestUrl)
  url.SetPort(msgPort)
  url.SetProxyBypass(["127.0.0.1", "localhost"]) ' BCN-8732

  aa = {}
  aa.method = "PUT"
  aa.request_body_string = ""
  aa.response_body_string = true
  
  registrationUrlEvent = url.SyncMethod(aa)
  rc = registrationUrlEvent.getResponseCode()

  if rc = 404 then
    ' 404 means endpoint does not exist
    ' we are probably talking to an old OS
    ' restart supervisor to trigger a registration request
    RestartApplication()
    stop
  endif

  if rc = 200 then

    result = registrationUrlEvent.getString()
    payload = ParseJson(result)
    if type(payload) = "roAssociativeArray" and type(payload.data) = "roAssociativeArray" and type(payload.data.result) = "roAssociativeArray" and type(payload.data.result.setup) = "roAssociativeArray" and type(payload.data.result.setup.network) = "roAssociativeArray" and IsBoolean(payload.data.result.setup.network.success) then
      
      if payload.data.result.setup.network.success then
        return "networkSetupSuccess"
      else
        return "networkSetupFailure"
      endif

    endif

    return "networkSetupNotFound"

  else

    ' BCN-8430 if failed to trigger a registration request, restart application
    print "Failed to trigger registration request. Error code:";ok
    RestartApplication()
    stop

  endif

end function


Function EnableDebugging(filePath$) as object
  
  debugParams = { }
  
  debugParams.serialDebugOn = false
  debugParams.systemLogDebugOn = false
  
  syncSpec = CreateObject("roSyncSpec")
  
  if syncSpec.ReadFromFile(filePath$) then
    if syncSpecValueTrue(syncSpec.LookupMetadata("client", "enableSerialDebugging")) then
      debugParams.serialDebugOn = true
    end if
    if syncSpecValueTrue(syncSpec.LookupMetadata("client", "enableSystemLogDebugging")) then
      debugParams.systemLogDebugOn = true
    end if
  end if
  
  syncSpec = invalid
  
  return debugParams
  
end function


REM *******************************************************
REM *******************************************************
REM ***************                    ********************
REM *************** DIAGNOSTICS OBJECT ********************
REM ***************                    ********************
REM *******************************************************
REM *******************************************************

REM
REM construct a new diagnostics BrightScript object
REM
Function newDiagnostics(sysFlags as object) as object
  
  diagnostics = { }
  
  diagnostics.debug = sysFlags.debugOn
  diagnostics.systemLogDebug = sysFlags.systemLogDebugOn

  if diagnostics.systemLogDebug then
    diagnostics.systemLog = CreateObject("roSystemLog")
  end if

  diagnostics.setupVersion$ = "unknown"
  diagnostics.deviceFWVersion$ = "unknown"
  diagnostics.systemTime = CreateObject("roSystemTime")
  
  diagnostics.PrintDebug = PrintDebug
  diagnostics.PrintTimestamp = PrintTimestamp
  diagnostics.SetSystemInfo = SetSystemInfo
  diagnostics.TurnDebugOn = TurnDebugOn
    
  return diagnostics
  
end function


Sub PrintDebug(debugStr$ as string)
  
  if type(m) <> "roAssociativeArray" then stop
  
  if m.debug then    
    print debugStr$
  end if
  
  if m.systemLogDebug then
    m.systemLog.SendLine(debugStr$)
  end if
  
end sub


Sub PrintTimestamp()
  
  eventDateTime = m.systemTime.GetLocalDateTime()
  if m.debug then print eventDateTime.GetString()
  if m.systemLogDebug then m.systemLog.SendLine(eventDateTime.GetString())
  
end sub


Sub SetSystemInfo(sysInfo as object, diagnosticCodes as object)
  
  m.setupVersion$ = sysInfo.setupVersion$
  m.deviceFWVersion$ = sysInfo.deviceFWVersion$
  m.deviceUniqueID$ = sysInfo.deviceUniqueID$
  m.deviceModel$ = sysInfo.deviceModel$
  m.deviceFamily$ = sysInfo.deviceFamily$
  m.deviceFWVersionNumber% = sysInfo.deviceFWVersionNumber%
  
  m.diagnosticCodes = diagnosticCodes
  
end sub


Sub TurnDebugOn()
  
  m.debug = true
  
  return
  
end sub


Function IsBoolean(inputVariable as object) as boolean

  if type(inputVariable) = "roBoolean" or type(inputVariable) = "boolean" then return true
  return false

end function


Function IsString(inputVariable as object) as boolean
  
  if type(inputVariable) = "roString" or type(inputVariable) = "String" then return true
  return false
  
end function
