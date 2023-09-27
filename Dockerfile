# Use the official Go image to create a build artifact.
FROM golang:1.17 as builder

# Set the working directory outside $GOPATH to enable the go modules.
WORKDIR /src

# Copy the local package files to the container’s workspace.
ADD main.go .

# Build the command inside the container.
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

# Use a minimal alpine image
FROM alpine:3.14

# Copy the binary to the production image from the builder stage.
COPY --from=builder /src/app /app

# Run the web service on container startup.
CMD ["/app"]
