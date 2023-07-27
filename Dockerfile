FROM squidfunk/mkdocs-material:9.1.21

RUN pip install mkdocs-git-revision-date-localized-plugin

ENTRYPOINT [ "sh","-c" ]