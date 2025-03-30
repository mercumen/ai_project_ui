from fastapi import FastAPI
from pydantic import BaseModel
import pickle


with open("iris_model.pkl", "rb") as f:
    model = pickle.load(f)

app = FastAPI()

class PredictionInput(BaseModel):
    values: list[float]

@app.post("/predict/")
def predict(data: PredictionInput):
    prediction = model.predict([data.values])
    return {"prediction": int(prediction[0])}
# we dont need this file but i want to show how i teach machine