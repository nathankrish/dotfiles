inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
if [ "$inside_git_repo" ]; then
	CBRANCH=$(git rev-parse --abbrev-ref HEAD)
	echo -e "${COLOR_WHITE}git[${COLOR_LIGHT_RED}${CBRANCH}${COLOR_WHITE}]"
else
	echo ""
fi
