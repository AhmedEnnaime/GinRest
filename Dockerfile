FROM golang:1.20

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go mod tidy

# Download and install Air binary
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/local/bin

EXPOSE 8080

CMD ["air", "-c", ".air.toml"]
