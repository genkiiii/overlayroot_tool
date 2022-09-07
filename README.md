# overlayroot_tool
Tool to sync a file and a directory under overlayroot read-only environment

overlayroot_syncは、overlayroot利用時にファイルもしくはディレクトリをread-write領域にrsyncします。  
これにより、ロボット実機ではread-onlyで開発を進めつつ、保存する必要のあるファイルもしくはディレクトリのみread-write下にコピーすることが可能になります。

overlayroot自体は[こちら](https://packages.ubuntu.com/jammy/overlayroot)で確認してください

インストール方法：
```
 git clone https://github.com/genkiiii/overlayroot_tool.git
 cd overlayroot_tool
 make install
```
使い方:
```
 sudo overlayroot-sync <file1 path> <file2 path> <directory1 path>...
```
