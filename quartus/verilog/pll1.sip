set_global_assignment -entity "pll1" -library "lib_pll1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll1" -library "lib_pll1" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll1" -library "lib_pll1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll1" -name SPD_FILE [file join $::quartus(sip_path) "pll1.spd"]

set_global_assignment -library "lib_pll1" -name MISC_FILE [file join $::quartus(sip_path) "pll1_sim/pll1.vo"]
