# Pull node base image
FROM oven/bun:1

#Define environment variables
ARG TZ
ARG ORIGIN
ENV TZ $TZ
ENV ORIGIN $ORIGIN

# Install node dependencies
WORKDIR /app
COPY ./package.json .
COPY ./svelte.config.js .
RUN bun install

# Move to container
COPY . .

# Build for production
RUN bun run build

# Launch app
CMD ["bun", "run", "/app/build/index.js"]
EXPOSE 3000