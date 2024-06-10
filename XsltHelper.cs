namespace xmltoabl
{
    public class XsltHelper
    {
        public string SetRight(string input, int length)
        {
            return input.PadRight(length, ' ');
        }

        public string SetRight(string input, int length, string paddingChar = " ")
        {
            return input.PadRight(length, Convert.ToChar(paddingChar));
        }

        public string SetLeft(string input, int length)
        {
            return input.PadLeft(length, ' ');
        }

        public string SetLeft(string input, int length, string paddingChar = " ")
        {
            return input.PadLeft(length, Convert.ToChar(paddingChar));
        }

        public string FormatDateAndPadRight(string dateTime, int length, string format)
        {
            if (dateTime == string.Empty)
                return dateTime.PadRight(length, ' ');

            var convertedInput = Convert.ToDateTime(dateTime);
            return convertedInput.ToString(format).PadRight(length, '#');
        }
        public string SetGender(string genderId)
        {

            if (genderId != "Male")
                return "2".PadRight(1, ' ');

            return "1".PadRight(1, ' ');
        }

        public string SetTobacco(string tobaccoId)
        {

            if (tobaccoId == "true")
                return "1".PadRight(1, ' ');
            else if (tobaccoId == "false")
                return "2".PadRight(1, ' ');

            return string.Empty.PadRight(1, ' ');
        }

        public string SetSalaryBasis(string salaryBasis)
        {
            if (Enum.TryParse<SalaryBasis>(salaryBasis, out var basis))
                return ((int)basis).ToString();

            return string.Empty;
        }


        enum SalaryBasis
        {
            Annually = 1,
            Monthly,
            Biweekly,
            Hourly,
            Semi_Monthly
        }

    }
}
