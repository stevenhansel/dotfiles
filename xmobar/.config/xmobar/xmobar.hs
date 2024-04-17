Config { font            = "Hasklug Nerd Font 9"
       , additionalFonts = [ "Mononoki 11"
                           , "Font Awesome 6 Free Solid 12"
                           , "Font Awesome 6 Brands 12"
                           ]
       , bgColor      = "#2D2A2E"
       , fgColor      = "#FCFCFA"
       , position     = TopSize L 100 24
       , lowerOnStart = True
       , hideOnStart  = False
       , allDesktops  = True
       , persistent   = True
       , iconRoot     = ".config/xmobar"  -- default: "."
       , commands = [
                        -- Echos a "penguin" icon in front of the kernel output.
                      Run Com "echo" ["<fn=3>\xf17c</fn>"] "penguin" 3600
                        -- Get kernel version (script found in .local/bin)
                    , Run Com ".local/bin/kernel" [] "kernel" 36000
                        -- Cpu usage in percent
                    , Run Cpu ["-t", "<fn=2>\xf108</fn>  cpu: (<total>%)","-H","50","--high","red"] 20
                        -- Ram used number and percent
                    , Run Memory ["-t", "<fn=2>\xf233</fn>  mem: <used>M (<usedratio>%)"] 20
                        -- Disk space fre
                    , Run DiskU [("/", "<fn=2>\xf0c7</fn>  hdd: <free> free")] [] 60
                        -- Echos an "up arrow" icon in front of the uptime output.
                    , Run Com "echo" ["<fn=2>\xf0aa</fn>"] "uparrow" 3600
                        -- Uptime
                    , Run Uptime ["-t", "uptime: <days>d <hours>h"] 360
                        -- Echos a "bell" icon in front of the pacman updates.
                    , Run Com "echo" ["<fn=2>\xf0f3</fn>"] "bell" 3600
                        -- Check for pacman updates (script found in .local/bin)
                    , Run Com ".local/bin/pacupdate" [] "pacupdate" 36000
                        -- Echos a "battery" icon in front of the pacman updates.
                    , Run Com "echo" ["<fn=2>\xf242</fn>"] "baticon" 3600
                        -- Time and date
                    , Run Date "<fn=2>\xf017</fn>  %b %d %Y - (%H:%M) " "date" 50
                        -- Prints out the left side items such as workspaces, layout, etc.
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <action=`dm-run`><icon=logo.xpm/></action> <fc=#666666>|</fc> %UnsafeStdinReader% }{ <box type=Bottom width=2 mb=2 color=#FF6188><fc=#FF6188>%penguin%  %kernel%</fc></box>    <box type=Bottom width=2 mb=2 color=#A9DC76><fc=#A9DC76><action=`alacritty -e htop`>%cpu%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#FC9867><fc=#FC9867><action=`alacritty -e htop`>%memory%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#FFD866><fc=#FFD866>%disku%</fc></box>    <box type=Bottom width=2 mb=2 color=#AB9DF2><fc=#AB9DF2>%uparrow%  %uptime%</fc></box>    <box type=Bottom width=2 mb=2 color=#A9DC76><fc=#A9DC76><action=`emacsclient -c -a 'emacs' --eval '(doom/window-maximize-buffer(dt/year-calendar))'`>%date%</action></fc></box>"
       }


