package main

import (
	"fmt"
	"net/http"

	"github.com/sirupsen/logrus"
)

var logger logrus.FieldLogger

func main() {
	logger = logrus.New()

	http.HandleFunc("/", rootH)
	http.HandleFunc("/health", healthH)
	http.ListenAndServe(":8080", nil)
}

func rootH(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
	logger.WithFields(logrus.Fields{"urlPath": r.URL.Path[1:]}).Error("invalid actions happened")

}

func healthH(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "OK")
}