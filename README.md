# overlayroot_tool
Tool to sync a file and a directory under overlayroot read-only environment

overlayroot_syncは、overlayroot利用時にファイルもしくはディレクトリをread-write領域にrsyncします。  
これにより、ロボット実機ではread-onlyで開発を進めつつ、保存する必要のあるファイルもしくはディレクトリのみread-write下にコピーすることが可能になります。

overlayroot自体は[こちら](https://packages.ubuntu.com/jammy/overlayroot)で確認してください

### インストール方法
```
 sudo apt install overlayroot （overlayroot自体のインストール）
 git clone https://github.com/genkiiii/overlayroot_tool.git
 cd overlayroot_tool
 sudo make install
```
### 使い方
```
 sudo overlayroot-sync <file1 path> <file2 path> <directory1 path>...
```
カレントディレクトリ以下を保存したい場合：
```
 sudo overlayroot-sync ./
```

### Tips
- apt updateやapt install等をしたい場合は、overlayrootに付属しているシェルスクリプト（overlayroot-chroot）を利用する。overlayroot-chrootは、ready-writeに再マウントして、ルートフォルダを変更するシェルスクリプト。
- overlayrootを無効にしたい場合、/etc/overlayroot.confを開き、overlayroot=""とした後、/etc/overlayroot.confをoverlayroot-syncで保存して、再起動する。
- overlayrootを有効にしたい場合、/etc/overlayroot.confを開き、overlayroot="tmpfs"とした後、再起動する。

### 除外ファイル
overlayrootにより展開されたファイル(fstab)などを、overlayroot-syncを使いread-only下に保存するとマウント情報が変わってしまう。
上記作業後にoverlayrootを無効にして起動すると、誤ったfstabのため起動に失敗する。そのようなoverlayroot-syncで保存してはいけないファイルについて、rsyncのexclude fileオプションを用いて、''exclude_list''に書かれた名前のファイルを同期から除外している。
