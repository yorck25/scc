using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();

        public string token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF5ZXJJZCI6MSwiZXhwIjoxNzQ0MjMyOTI4LCJpYXQiOjE3NDQxNDY1Mjh9.6tGzl3-8pII_1s3mjvBfrtBXotBAg-i0pFlRERu4ZdA";

        public override string ToString()
        {
            return "authToken: " + token;
        }
    }

    public class GameToken
    {
        private static GameToken _instance;
        public static GameToken Instance => _instance ??= new GameToken();

        public string token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJnYW1lSWQiOjE0LCJwbGF5ZXJJZCI6MSwiZXhwIjoxNzQ0MjM0MjQ2LCJpYXQiOjE3NDQxNDc4NDZ9.NBPYaL7yNxN5hkhs-MiBDJ0uaTxIOwxSxMbBPV37daU";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }
}