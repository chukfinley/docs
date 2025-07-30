# ---- build stage ----
FROM squidfunk/mkdocs-material:latest AS builder

# copy docs source into image
COPY . /docs
WORKDIR /docs

# build the static site
RUN mkdocs build --strict

# ---- runtime stage ----
FROM nginx:alpine
COPY --from=builder /docs/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]