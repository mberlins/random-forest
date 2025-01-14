library(randomForest)
library(caret)


getRFModel = function(formula, data) {
  return (randomForest(formula, data = data, ntree = 500, mtry = 16, nodesize = 3))
}

makeRFPrediction = function(model, data) {
  return (predict(model, newdata = data))
}


getRFConfMatrix = function(data) {
  attach(splitData(data))
  
  rf = getRFModel(cl ~ ., trainData)
  prediction = makeRFPrediction(rf, testData)
  
  return (confusionMatrix(prediction, testData$cl, mode="everything"))
}
