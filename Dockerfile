# ---- build stage ----
FROM squidfunk/mkdocs-material:latest AS builder

# install the missing plugin (and any other pip extras you need)
RUN pip install --no-cache-dir \
      mkdocs-git-revision-date-localized-plugin

# copy docs source
COPY . /docs
WORKDIR /docs

# build the static site
RUN mkdocs build --strict

# ---- runtime stage ----
FROM nginx:alpine
COPY --from=builder /docs/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]