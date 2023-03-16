ReplaceFlags(InputStr) {
	; `%dd --> replaced by day: 01 - 31
  ; `%d --> replaced by day: 1 - 31
  ; `%MM --> replaced by month: 01 - 12
  ; `%M --> replaced by month: 1 - 12
  ; `%y --> replaced by year: e.g. 8 (no leading zero)
  ; `%yy --> replaced by year: e.g. 08 (with leading zero)
  ; `%yyyy --> replaced by year: e.g. 2017
	; `%hh --> replaced by hour: 01 - 12
	; `%h --> replaced by hour: 1 - 12
	; `%HH --> replaced by hour: 01 - 23
	; `%H --> replaced by hour: 1 - 23
	; `%mm --> replaced by minutes: 00 - 59
	; `%m --> replaced by minutes: 0 - 59
	; `%ss --> replaced by seconds: 00 - 59
	; `%s --> replaced by seconds: 0 - 59

  if InStr(InputStr, "`%dd", true)
  {
    FormatTime, ReplaceText, YYYYMMDDHH24MISS, dd
    StringReplace, InputStr, InputStr, `%dd, %ReplaceText%, All
  }

  if InStr(InputStr, "`%d", true)
  {
    FormatTime, ReplaceText, YYYYMMDDHH24MISS, d
    StringReplace, InputStr, InputStr, `%d, %ReplaceText%, All
  }

  if InStr(InputStr, "`%MM", true)
  {
    FormatTime, ReplaceText, YYYYMMDDHH24MISS, MM
    StringReplace, InputStr, InputStr, `%MM, %ReplaceText%, All
  }

  if InStr(InputStr, "`%M", true)
  {
    FormatTime, ReplaceText, YYYYMMDDHH24MISS, M
    StringReplace, InputStr, InputStr, `%M, %ReplaceText%, All
  }

  if InStr(InputStr, "`%yyyy", true)
  {
    FormatTime, ReplaceText, YYYYMMDDHH24MISS, yyyy
    StringReplace, InputStr, InputStr, `%yyyy, %ReplaceText%, All
  }

  if InStr(InputStr, "`%yy", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, yy
	  StringReplace, InputStr, InputStr, `%yy, %ReplaceText%, All
  }

  if InStr(InputStr, "`%y", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, y
	  StringReplace, InputStr, InputStr, `%y, %ReplaceText%, All
  }

	if InStr(InputStr, "`%hh", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, hh
	  StringReplace, InputStr, InputStr, `%hh, %ReplaceText%, All
  }

	if InStr(InputStr, "`%h", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, h
	  StringReplace, InputStr, InputStr, `%h, %ReplaceText%, All
  }

	if InStr(InputStr, "`%HH", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, HH
	  StringReplace, InputStr, InputStr, `%HH, %ReplaceText%, All
  }

	if InStr(InputStr, "`%H", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, H
	  StringReplace, InputStr, InputStr, `%H, %ReplaceText%, All
  }

	if InStr(InputStr, "`%mm", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, mm
	  StringReplace, InputStr, InputStr, `%mm, %ReplaceText%, All
  }

	if InStr(InputStr, "`%m", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, m
	  StringReplace, InputStr, InputStr, `%m, %ReplaceText%, All
  }

	if InStr(InputStr, "`%ss", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, ss
	  StringReplace, InputStr, InputStr, `%ss, %ReplaceText%, All
  }

	if InStr(InputStr, "`%s", true)
  {
	  FormatTime, ReplaceText, YYYYMMDDHH24MISS, s
	  StringReplace, InputStr, InputStr, `%s, %ReplaceText%, All
  }

	if InStr(InputStr, "{n}", true)
	{
		InputStr := StrSplit(InputStr, "{n}")
	}

	If IsObject(InputStr)
	{
		for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
		{
			if % i > InputStr.Length()
			{
				break
			}

			x1 := % InputStr[i]
			StringReplace, x1, x1, ``,, All
			InputStr[i] := x1
		}
	}
	Else
	{
		StringReplace, InputStr, InputStr, ``,, All
	}

  return InputStr
}
