FROM squidfunk/mkdocs-material:9.5.14

RUN pip install mkdocs-git-revision-date-localized-plugin

ENTRYPOINT [ "sh","-c" ]