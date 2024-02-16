using System;
using System.Net;

namespace HelloWorldApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            // Print command-line arguments
            foreach (var arg in args)
            {
                Console.WriteLine("Command-line argument: " + arg);
            }
        }
    }
}