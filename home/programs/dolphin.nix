{ config, pkgs, lib, ... }:

{
  home.file."/home/astronomia/.config/dolphinrc".text = ''
    [ContentDisplay]
    DirectorySizeMode=ContentSize
    UseShortRelativeDates=false

    [DetailsMode]
    IconSize=32
    PreviewSize=64

    [General]
    BrowseThroughArchives=true
    EditableUrl=true
    FilterBar=true
    OpenExternallyCalledFolderInNewTab=true
    OpenNewTabAfterLastTab=true
    ShowFullPath=true
    ShowFullPathInTitlebar=true
    ShowStatusBar=FullWidth
    ShowZoomSlider=true
    Version=202
    ViewPropsTimestamp=2025,6,11,19,18,41.109

    [KFileDialog Settings]
    Places Icons Auto-resize=false
    Places Icons Static Size=22

    [MainWindow]
    MenuBar=Disabled

    [PreviewSettings]
    Plugins=appimagethumbnail,audiothumbnail,comicbookthumb
 nail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbn
 ail,directorythumbnail,imagethumbnail,jpegthumbnail,kraorat
 humbnail,windowsexethumbnail,windowsimagethumbnail,opendocu
 mentthumbnail,svgthumbnail
     '';

}
