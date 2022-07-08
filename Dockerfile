from golang:1.16 as builder

# Definindo diretório de trabalho
WORKDIR /go/src/app

# Copiando diretório para a imagem
# Como é o WORKDIR poderia também ser: ADD . .
ADD . .
RUN ls -a
# Executando comando de build
RUN GOOS=linux go build main.go

from alpine:3.16 as prod

# Definindo diretório de trabalho
WORKDIR /go/src/app

COPY --from=builder /go/src/app .

ENTRYPOINT [ "./main" ]