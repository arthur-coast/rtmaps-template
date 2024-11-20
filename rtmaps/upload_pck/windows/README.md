# upload pck (for windows users)

Instruction to create an archive of your pck and ship it on deployement site.
## build xml generation
generate xml with all the dependencies of your pck. Update the xml file only if you change your dependencies.
```bash
cd .\rtmaps\upload_pck\
.\build_xml_generation.bat
```
Expected output:
![image](../../doc/rtmaps/upload_pck/build_xml_generation.png)

## update xml file to add your dependencies
Creating a folder with the name of the pck. Add the pck into this folder and create a bin folder with all the dependencies.
```xml
    <folder name="bin"/>
    <folder name="doc">
      <folder name="studio_reference">
        <folder name="components"/>
        <folder name="resources"/>
        <folder name="rrms"/>
        <folder name="tips"/>
      </folder>
    </folder>
    <folder name="packages">
      <folder name="coast_inventory">
        <folder name="bin">
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/gflags.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/glog.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/jpeg62.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/liblzma.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/libpng16.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/libsharpyuv.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/libwebp.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/libwebpdecoder.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/opencv_core4.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/opencv_imgcodecs4.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/opencv_imgproc4.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/pthreadVC2.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/tiff.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/tinyxml2.dll]]></file>
          <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/bin/zlib1.dll]]></file>
        </folder>
      <file><![CDATA[C:/dev/rtmaps/user_sdk/packages/coast_inventory/Release/coast_inventory.pck]]></file>
      </folder>
    </folder>
    <folder name="tools"/>
```
## archive generation
Generate RTMaps pck archive to upload on rtmaps_uploader_site. This archive is based on the xml file.
If an arhive file already exists this script will failed (or save the archive somewhere else). Delete the archive and run it again
```bash
cd .\rtmaps\upload_pck\
.\archive_generation.bat
```
Expected output:
![image](../../doc/rtmaps/upload_pck/archive_generation.png)
To Check if our archive contains all our dependencies, you can unzip it and try to load it into RTMaps.

## ship pck to server
```bash
cd .\rtmaps\upload_pck\
.\ship_pck_to_server.bat
```

## download pck
```bash
cd .\rtmaps\upload_pck\
.\download_pck.bat
```
your pck will be save at the following link :
```bash
C:\Program Files\Intempora\RTMaps 4\packages
```