#!/bin/bash

cmd="/usr/lib/jvm/java-6-openjdk-i386/bin/java"

vmargs="fml.ignoreInvalidMinecraftCertificates=true"

libs="/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives:/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/build/natives"

encoding="UTF-8"

classpath="/home/paul/Dropbox/paul-Dell-System-Inspiron-N411Z/working/external/minecraft/forge/forge-1.7.2-10.12.0.1022-src/bin:/home/paul/.gradle/caches/minecraft/net/minecraftforge/forge/1.7.2-10.12.0.1022/forgeSrc-1.7.2-10.12.0.1022.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.minecraft/launchwrapper/1.9/jar/116f2aad5b0c68353ebed66cd463517db6522f7e/launchwrapper-1.9.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.ow2.asm/asm-debug-all/4.1/jar/dd6ba5c392d4102458494e29f54f70ac534ec2a2/asm-debug-all-4.1.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.scala-lang/scala-library/2.10.2/jar/6ba65d12cd09d441083262d6f73d2257fec7c663/scala-library-2.10.2.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.scala-lang/scala-compiler/2.10.2/jar/64c8b1380cc53d6850823d6e4e7ae984aa44ef9c/scala-compiler-2.10.2.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.sf.jopt-simple/jopt-simple/4.5/jar/6065cc95c661255349c1d0756657be17c29a4fd3/jopt-simple-4.5.jar:/home/paul/.gradle/caches/artifacts-26/filestore/java3d/vecmath/1.3.1/jar/a0ae4f51da409fa0c20fa0ca59e6bbc9413ae71d/vecmath-1.3.1.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.sf.trove4j/trove4j/3.0.3/jar/42ccaf4761f0dfdfa805c9e340d99a755907e2dd/trove4j-3.0.3.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.ibm.icu/icu4j-core-mojang/51.2/jar/63d216a9311cca6be337c1e458e587f99d382b84/icu4j-core-mojang-51.2.jar:/home/paul/.gradle/caches/artifacts-26/filestore/lzma/lzma/0.0.1/jar/521616dc7487b42bef0e803bd2fa3faf668101d7/lzma-0.0.1.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.paulscode/codecjorbis/20101023/jar/c73b5636faf089d9f00e8732a829577de25237ee/codecjorbis-20101023.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.paulscode/codecwav/20101023/jar/12f031cfe88fef5c1dd36c563c0a3a69bd7261da/codecwav-20101023.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.paulscode/libraryjavasound/20101123/jar/5c5e304366f75f9eaa2e8cca546a1fb6109348b3/libraryjavasound-20101123.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.paulscode/librarylwjglopenal/20100824/jar/73e80d0794c39665aec3f62eee88ca91676674ef/librarylwjglopenal-20100824.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.paulscode/soundsystem/20120107/jar/419c05fe9be71f792b2d76cfc9b67f1ed0fec7f6/soundsystem-20120107.jar:/home/paul/.gradle/caches/artifacts-26/filestore/io.netty/netty-all/4.0.10.Final/jar/9e50bd52ffe257a0e2cd8d971688d6ce7d174325/netty-all-4.0.10.Final.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.google.guava/guava/15.0/bundle/ed727a8d9f247e2050281cb083f1c77b09dcb5cd/guava-15.0.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.apache.commons/commons-lang3/3.1/jar/905075e6c80f206bbe6cf1e809d2caa69f420c76/commons-lang3-3.1.jar:/home/paul/.gradle/caches/artifacts-26/filestore/commons-io/commons-io/2.4/jar/b1b6ea3b7e4aa4f492509a4952029cd8e48019ad/commons-io-2.4.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.java.jinput/jinput/2.0.5/jar/39c7796b469a600f72380316f6b1f11db6c2c7c4/jinput-2.0.5.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.java.jutils/jutils/1.0.0/jar/e12fe1fda814bd348c1579329c86943d2cd3c6a6/jutils-1.0.0.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.google.code.gson/gson/2.2.4/jar/a60a5e993c98c864010053cb901b7eab25306568/gson-2.2.4.jar:/home/paul/.gradle/caches/artifacts-26/filestore/com.mojang/authlib/1.3/jar/4fb033c2d6eccced08752d8f33e8c3a0a45deb2d/authlib-1.3.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.apache.logging.log4j/log4j-api/2.0-beta9/jar/1dd66e68cccd907880229f9e2de1314bd13ff785/log4j-api-2.0-beta9.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.apache.logging.log4j/log4j-core/2.0-beta9/jar/678861ba1b2e1fccb594bb0ca03114bb05da9695/log4j-core-2.0-beta9.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.lwjgl.lwjgl/lwjgl/2.9.0/jar/5654d06e61a1bba7ae1e7f5233e1106be64c91cd/lwjgl-2.9.0.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.lwjgl.lwjgl/lwjgl_util/2.9.0/jar/a778846b64008fc7f48ead2377f034e547991699/lwjgl_util-2.9.0.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.lwjgl.lwjgl/lwjgl-platform/2.9.0/jar/2ba5dcb11048147f1a74eff2deb192c001321f77/lwjgl-platform-2.9.0-natives-linux.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.lwjgl.lwjgl/lwjgl-platform/2.9.0/jar/6621b382cb14cc409b041d8d72829156a87c31aa/lwjgl-platform-2.9.0-natives-osx.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.lwjgl.lwjgl/lwjgl-platform/2.9.0/jar/3f11873dc8e84c854ec7c5a8fd2e869f8aaef764/lwjgl-platform-2.9.0-natives-windows.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.java.jinput/jinput-platform/2.0.5/jar/7ff832a6eb9ab6a767f1ade2b548092d0fa64795/jinput-platform-2.0.5-natives-linux.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.java.jinput/jinput-platform/2.0.5/jar/53f9c919f34d2ca9de8c51fc4e1e8282029a9232/jinput-platform-2.0.5-natives-osx.jar:/home/paul/.gradle/caches/artifacts-26/filestore/net.java.jinput/jinput-platform/2.0.5/jar/385ee093e01f587f30ee1c8a2ee7d408fd732e16/jinput-platform-2.0.5-natives-windows.jar:/home/paul/.gradle/caches/artifacts-26/filestore/org.scala-lang/scala-reflect/2.10.2/jar/444ff8e89a81697997ed8a98a4642ba283130249/scala-reflect-2.10.2.jar"

mainclass="net.minecraft.launchwrapper.Launch"

progargs="--version 1.6 --tweakClass cpw.mods.fml.common.launcher.FMLTweaker --accessToken modstest"

exec "${cmd}" -D"${vmargs}" -Djava.library.path="${libs}" -Dfile.encoding="${encoding}" -classpath "${classpath}" "${mainclass}" ${progargs}