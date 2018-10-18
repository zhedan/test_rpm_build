Name:           test_rpm_build
Version:        1.0.0
Release:        20171201.el7
Summary:        test_rpm_build

License:        ASL 2.0

BuildArch:      noarch

BuildRequires:  python-setuptools


%description
test_rpm_build

%prep
%setup -DT -n %{name}

%build
python setup.py build_ext -b %{python_sitelib} --inplace

%install
python setup.py install --no-compile --skip-build --root $RPM_BUILD_ROOT

%files
%{python_sitelib}/%{name}
%{python_sitelib}/%{name}*.egg-info/


%changelog
