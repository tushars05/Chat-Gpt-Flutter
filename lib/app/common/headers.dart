const String OPEN_AI_KEY =
    "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";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
