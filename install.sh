find . -depth 1 -name ".*" -not -regex ".*\.git.*" -exec sh -c 'TRIMMED=$(echo {} | sed -e "s|\./||"); ln -si $PWD/$TRIMMED ~' {} \;
