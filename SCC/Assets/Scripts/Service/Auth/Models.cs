using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();

        public string token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF5ZXJJZCI6MSwiZXhwIjoxNzQ0NjE1MTQyLCJpYXQiOjE3NDQ1Mjg3NDJ9.hVbIeHKd7af5ygj-XUZKdMOSGprXHEUFxTu9p5OJ4Ks";

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
            "";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }
}