#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV_XS;
use File::Path qw(make_path);
use Cwd;

my $inputFilePath = $ARGV[0];
my $outputFilePath = $ARGV[1];
my $path = $ARGV[1];
$path =~ s/[^\/]*$//;
#my $pwd = cwd();
my $tempFilesDir = "/tmp/convertTempFiles";

mkdir $tempFilesDir;
make_path ($path);

system("kdu_compress", "-i", "$inputFilePath", "-o", "$outputFilePath", "Cblk={64,64}", "Corder=RPCL", "ORGgen_plt=yes", "ORGtparts=R",
		"Cprecincts={256,256}", "Creversible=yes", "Clevels=5", "Cmodes={BYPASS}",
		"-rate", "-,4,2.34,1.36,0.797,0.466,0.272,0.159,0.0929,0.0543,0.0317,0.0185",
		"-no_palette");
		
system("kdu_expand", "-i", "$outputFilePath", "-o", "$tempFilesDir/newTemp.tif");
qx(compare -metric psnr "$inputFilePath" "$tempFilesDir/newTemp.tif" "$tempFilesDir/diference.jpg" 2>"$tempFilesDir/stderr.txt");
#system("compare", "-metric", "psnr", "$inputFilePath", "$tempFilesDir/newTemp.tif", "$tempFilesDir/diference.jpg", "2>$tempFilesDir/stderr.txt");

open(my $file, "<", $tempFilesDir."/stderr.txt")or die "cannot open stderr.txt $!";
my $msg = <$file>;
chomp ($msg);
#For Windows
#if($msg eq "1.#INF"){
#For Linux
if($msg eq "inf"){
	print "\nOK\n\n";
}else{
	print "\nNOT OK\n\n";
	open(ERR, ">>", $tempFilesDir."/error.txt") or die "cannot open error.txt: $!";
	print ERR "Problem converting file: ".$inputFilePath."\n";
	close ERR;
	
}
close ($file);