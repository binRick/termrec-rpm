Name:           termrec
Version:        latest
Release:        1%{?dist}
Summary:        console terminal recording

License:        GPLv2
URL:            https://github.com/kilobyte/termrec
Source0: 	termrec-%{version}.tar.gz

%define _unpackaged_files_terminate_build 0


#BuildRequires:  sqlite-devel, libpcap-devel, zlib-devel, jansson-devel, mariadb-devel

%description
tty recorder/player http://angband.pl/termrec.html

%prep
%setup -q

%build
./autogen.sh
%configure
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
%make_install
find %{buildroot} -type f | sed 's|^%{buildroot}||' > filelist
grep '/man/' filelist | sed 's/$/*/g' > filelist2
grep -v '/man/' filelist >> filelist2
mv filelist2 filelist
cat filelist

%files -f filelist
