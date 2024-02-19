# Pull node base image
FROM oven/bun:1

#Define environment variables
ARG TZ
ENV TZ $TZ
ENV PROTOCOL_HEADER x-forwarded-proto 
ENV HOST_HEADER x-forwarded-host

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