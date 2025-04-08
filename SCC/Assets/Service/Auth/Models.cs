using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();
        public string token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF5ZXJJZCI6MSwiZXhwIjoxNzQ0MjMyOTI4LCJpYXQiOjE3NDQxNDY1Mjh9.6tGzl3-8pII_1s3mjvBfrtBXotBAg-i0pFlRERu4ZdA";
        public int? userId;

        public override string ToString()
        {
            return "authToken: " + token;
        }
    }

    public class GameToken
    {
        private static GameToken _instance;
        public static GameToken Instance => _instance ??= new GameToken();
        public string token = "";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }
}