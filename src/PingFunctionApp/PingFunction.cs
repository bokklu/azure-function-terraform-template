using System.Net;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;

namespace PingFunctionApp
{
    public class PingFunction
    {
        private readonly ILogger _logger;

        public PingFunction(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<PingFunction>();
        }

        [Function("ping")]
        public HttpResponseData Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = "ping")] HttpRequestData req)
        {
            _logger.LogInformation("C# HTTP trigger function processed a request.");

            var response = req.CreateResponse(HttpStatusCode.OK);
            response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

            response.WriteString("pong");

            return response;
        }
    }
}
