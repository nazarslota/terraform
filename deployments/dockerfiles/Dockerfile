# Use the official Go image to create a build artifact.
FROM golang:1.20 as builder

# Set the working directory outside $GOPATH to enable the go modules.
WORKDIR /src

# Copy the local package files to the container’s workspace.
COPY ./ .

# Build the command inside the container.
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

# Use a minimal alpine image with a specific version.
FROM alpine:3.14

# Create a non-root user and switch to it.
RUN adduser -D appuser
USER appuser

# Copy the binary to the production image from the builder stage.
COPY --from=builder /src/app /app

# Run the web service on container startup.
CMD ["/app"]
