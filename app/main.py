from fastapi import FastAPI
from pydantic import BaseModel
from prometheus_client import Counter, generate_latest
from starlette.responses import Response

app = FastAPI()

# Prometheus metric
metrics_counter = Counter("requests_total", "Total number of requests")

class Metric(BaseModel):
    view_count: int
    buffer_rate: float

@app.get("/health")
def health_check():
    return {"status": "ok"}

@app.post("/metrics")
def receive_metrics(data: Metric):
    metrics_counter.inc()
    return {"message": "Metric received", "data": data}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type="text/plain")
