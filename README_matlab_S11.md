# Z11 Extraction from S-Parameters (.s1p) — MATLAB

This script reads one-port Touchstone files (`.s1p`), converts them to **Z-parameters**, extracts **Z11**, plots the real/imaginary components versus frequency, and exports the data to CSV.

## What it does
For each `.s1p` file:
- Loads the file with `zparameters(...)`
- Extracts `Z11` using `rfparam(Zobj,1,1)`
- Plots `|Re(Z11)|` and `|Im(Z11)|` on a log-log scale
- Exports a CSV containing frequency and impedance components

## Requirements
- MATLAB with **RF Toolbox** (for `zparameters`, `rfparam`)

## Usage
1. Put your `.s1p` files in the same folder as the script (or provide full paths).
2. Update the filenames in the `fName` list.
3. Run the script.

Example filenames:
```matlab
fName = ["Width=0.63mm_250GHz.s1p", "Width=0.95mm_250GHz.s1p"];
```

## Output
For each input file, a CSV is created next to it:
- `<filename>.s1p.csv`

Typical exported columns (depending on the script version you use):
- `Frequency_Hz`
- `Re_Z11_Ohm`
- `Im_Z11_Ohm`
- `AbsRe_Z11_Ohm`
- `AbsIm_Z11_Ohm`

## Notes / Tips
- If you want **signed** imaginary part (not magnitude), export `imag(Z11)` instead of `abs(imag(Z11))`.
- If your dataset has fewer than 25,000 points, protect indexing with `N = min(25000, numel(freq));`.
- For better CSV compatibility and headers, prefer `writematrix` / `writetable` over the deprecated `csvwrite`.

## License
Use freely for research and internal work. Add a citation/acknowledgement if you adapt it for a publication.
