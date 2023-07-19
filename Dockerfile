FROM squidfunk/mkdocs-material:8.5.11

RUN pip install mkdocs-git-revision-date-localized-plugin

ENTRYPOINT [ "sh","-c" ]