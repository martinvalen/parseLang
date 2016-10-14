### Installing LuaJIT 2.1 with 5.2 compatibility

The application uses LuaJIT 2.1 and 5.2 compatibility, which needs to be installed. The easiest way to install it on Linux is explained below and it should be similar on mac.

1. Run the command

        git clone http://luajit.org/git/luajit −2.0.git

2. Change to version 2.1 by running the following command in the luajit-folder just created
    
        git checkout v2.1

3. Open the file luajit-2.0/src/Makefile and exchange the line

        #XCFLAGS+= −DLUAJIT ENABLE LUA52COMPAT with
        XCFLAGS+= −DLUAJIT ENABLE LUA52COMPAT

4. Make and install the program
        sudo make & make install

### Install MAD

1. Download MAD by cloning the git repository
    
        git clone http://github.com/martinvalen/parselang

2. Make LPEG

        make lpeg

## HOW TO INSTALL MAD

    make linux [LUADIR=/path/to/luajit/include]

or

    make macosx [LUADIR=/path/to/luajit/include]

LUADIR defaults to usr/local/include/luajit-2.1. If you get an er- ror fatal error: lua.h: No such file or directory, your LUADIR is wrong.
Your copy of MAD should now be ready to run!
