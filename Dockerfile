# Stage 1: Build
FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o hello

# Stage 2: Runtime
FROM alpine
WORKDIR /app
COPY --from=builder /app/hello .
ENTRYPOINT ["./hello"]
