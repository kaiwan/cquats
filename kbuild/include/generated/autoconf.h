/*
 * Automatically generated C config: don't edit
 * CQuATS Configuration
 */
#define CONFIG_FLAWFINDER_OPTS "--context --minlevel=2 --falsepositive"
#define CONFIG_COCCINELLE 1
#define CONFIG_VALGRIND_MEMCHECK_OPTS "--trace-children=yes --time-stamp=yes --errors-for-leak-kinds=definite"
#define CONFIG_COCCINELLE_VERBOSE 1
#define CONFIG_CQUATS_REPORTS_FOLDER "reports"
#define CONFIG_FLAWFINDER 1
#define CONFIG_CQUATS_RUNCMD_PFX_UTIL "time"
#define CONFIG_CQUATS_RUNCMD_PFX_UTIL_ARGS ""
#define CONFIG_TARGET_SRC_STATIC "~/src-show-2.6k/dd/devmem/device-memory-readwrite"
#define CONFIG_VALGRIND_TARGET_APP "ps -a"
#define CONFIG_VALGRIND_VIA_CQUATS 1
