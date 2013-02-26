svn=/usr/bin/svn
function svn_prompt_info {
    if [ $(in_svn) ]; then
        echo "$ZSH_PROMPT_BASE_COLOR$ZSH_THEME_SVN_PROMPT_PREFIX\
$ZSH_THEME_REPO_NAME_COLOR$(svn_get_repo_name)$ZSH_PROMPT_BASE_COLOR$ZSH_THEME_SVN_PROMPT_SUFFIX$ZSH_PROMPT_BASE_COLOR$(svn_dirty)$(svn_remote_updates)$ZSH_PROMPT_BASE_COLOR"
    fi
}


function in_svn() {
    if [[ -d .svn ]]; then
        echo 1
    fi
}

function svn_get_repo_name {
    if [ $(in_svn) ]; then
        $svn info | sed -n 's/Repository\ Root:\ .*\///p' | read SVN_ROOT
    
        $svn info | sed -n "s/URL:\ .*$SVN_ROOT\///p" # | sed "s/\/.*$//"
    fi
}

function svn_get_rev_nr {
    if [ $(in_svn) ]; then
        $svn info 2> /dev/null | sed -n s/Revision:\ //p
    fi
}

function svn_get_head_rev_nr {
    if [ $(in_svn) ]; then
        $svn info -rHEAD 2> /dev/null | sed -n s/Last\ Changed\ Rev:\ //p
    fi
}

function svn_dirty {
    if [ $(in_svn) ]; then
        s=$($svn status|grep -E '^\s*[ACDIM!?L]' 2>/dev/null)
        if [ $s ]; then 
            echo $ZSH_THEME_SVN_PROMPT_DIRTY
        else 
            echo $ZSH_THEME_SVN_PROMPT_CLEAN
        fi
    fi
}

function svn_remote_updates {
    if [ $(in_svn) ]; then
      if [ "$(svn_get_head_rev_nr)" -gt "$(svn_get_rev_nr)" ]; then 
            echo $ZSH_THEME_SVN_PROMPT_UPDATES
        else 
            echo $ZSH_THEME_SVN_PROMPT_CLEAN
        fi
    fi
}
