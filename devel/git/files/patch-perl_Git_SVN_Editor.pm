
  These two patches: 
      patch-git-svn.perl
      patch-perl_Git_SVN_Editor.pm
  Are forward ported from: http://marc.info/?l=git&m=125259772625008&w=2
  Updated here: https://github.com/splbio/git/tree/v2.1.2-git-svn-propset

--- perl/Git/SVN/Editor.pm.orig	2014-09-30 19:00:40 UTC
+++ perl/Git/SVN/Editor.pm
@@ -288,6 +288,57 @@ sub apply_autoprops {
 	}
 }
 
+sub check_attr
+{
+    my ($attr,$path) = @_;
+    if ( open my $fh, '-|', "git", "check-attr", $attr, "--", $path )
+    {
+	my $val = <$fh>;
+	close $fh;
+	$val =~ s/^[^:]*:\s*[^:]*:\s*(.*)\s*$/$1/;
+	return $val;
+    }
+    else
+    {
+	return undef;
+    }
+}
+
+# From which subdir have we been invoked?
+my $cmd_dir_prefix = eval {
+    command_oneline([qw/rev-parse --show-prefix/], STDERR => 0)
+} || '';
+
+sub apply_manualprops {
+	my ($self, $file, $fbat) = @_;
+	my $path = $cmd_dir_prefix . $file;
+	# diff has ::check_attr
+	#my $pending_properties = ::check_attr( "svn-properties", $path );
+	my $pending_properties = check_attr( "svn-properties", $path );
+	if ($pending_properties eq "") { return; }
+	# Parse the list of properties to set.
+	my @props = split(/;/, $pending_properties);
+	# TODO: get existing properties to compare to - this fails for add so currently not done
+	# my $existing_props = ::get_svnprops($file);
+	my $existing_props = {};
+	# TODO: caching svn properties or storing them in .gitattributes would make that faster
+	foreach my $prop (@props) {
+		# Parse 'name=value' syntax and set the property.
+		if ($prop =~ /([^=]+)=(.*)/) {
+			my ($n,$v) = ($1,$2);
+			for ($n, $v) {
+				s/^\s+//; s/\s+$//;
+			}
+			# FIXME: clearly I don't know perl and couldn't work out how to evaluate this better
+			if (defined $existing_props->{$n} && $existing_props->{$n} eq $v) {
+				my $needed = 0;
+			} else {
+				$self->change_file_prop($fbat, $n, $v);
+			}
+		}
+	}
+}
+
 sub A {
 	my ($self, $m, $deletions) = @_;
 	my ($dir, $file) = split_path($m->{file_b});
@@ -296,6 +347,7 @@ sub A {
 					undef, -1);
 	print "\tA\t$m->{file_b}\n" unless $::_q;
 	$self->apply_autoprops($file, $fbat);
+	$self->apply_manualprops($file, $fbat);
 	$self->chg_file($fbat, $m);
 	$self->close_file($fbat,undef,$self->{pool});
 }
@@ -311,6 +363,7 @@ sub C {
 	my $fbat = $self->add_file($self->repo_path($m->{file_b}), $pbat,
 				$upa, $self->{r});
 	print "\tC\t$m->{file_a} => $m->{file_b}\n" unless $::_q;
+	$self->apply_manualprops($file, $fbat);
 	$self->chg_file($fbat, $m);
 	$self->close_file($fbat,undef,$self->{pool});
 }
@@ -333,6 +386,7 @@ sub R {
 				$upa, $self->{r});
 	print "\tR\t$m->{file_a} => $m->{file_b}\n" unless $::_q;
 	$self->apply_autoprops($file, $fbat);
+	$self->apply_manualprops($file, $fbat);
 	$self->chg_file($fbat, $m);
 	$self->close_file($fbat,undef,$self->{pool});
 
@@ -348,6 +402,7 @@ sub M {
 	my $fbat = $self->open_file($self->repo_path($m->{file_b}),
 				$pbat,$self->{r},$self->{pool});
 	print "\t$m->{chg}\t$m->{file_b}\n" unless $::_q;
+	$self->apply_manualprops($file, $fbat);
 	$self->chg_file($fbat, $m);
 	$self->close_file($fbat,undef,$self->{pool});
 }
