       
       #!/bin/bash
       # Auto-watch SCSS files in a single folder and compile to CSS in the same folder
      SCSS_DIR="/home/vagrant/git-repos/My-Portfolio/styles"

      echo "Watching SCSS folder: $SCSS_DIR"

      while true; do
      # Wait for a modify event and get the filename
      MODIFIED_FILE=$(inotifywait -e modify -r --format '%w%f' "$SCSS_DIR")
  
      # Only process if the modified file ends with .scss
      if [[ "$MODIFIED_FILE" == *.scss ]]; then
       # Output CSS file in the same folder
      OUTPUT_FILE="${MODIFIED_FILE%.scss}.css"

      # Compile the changed SCSS file
      sass "$MODIFIED_FILE":"$OUTPUT_FILE"
      echo "Compiled $(basename "$MODIFIED_FILE") to $(basename "$OUTPUT_FILE") at $(date)"
    fi
  done
